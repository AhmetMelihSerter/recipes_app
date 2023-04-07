import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:input_history_text_field/input_history_text_field.dart';
import 'package:kartal/kartal.dart';
import 'package:recipes_app/core/base/view_model/base_view_model.dart';
import 'package:recipes_app/feature/recipes/recipes_sub/model/recipes_params_model.dart';
import 'package:recipes_app/feature/recipes/recipes_sub/model/recipes_response_model.dart';
import 'package:recipes_app/feature/recipes/recipes_sub/service/i_recipes_service.dart';
import 'package:recipes_app/product/constants/enums/product_enum.dart';
import 'package:recipes_app/product/init/navigation/navigation_router.dart';

class RecipesViewModel extends BaseViewModel {
  RecipesViewModel(this._service);
  final IRecipesService _service;

  late final TextEditingController searchController;

  late final InputHistoryController searchHistoryController;

  final String _fadeInUpValue = 'fadeInUp';

  late ValueKey<String> fadeInUpKey;

  late AnimationPlayStates animationType;

  RecipesResponseModel? _recipesResponseModel;

  RecipesResponseModel? get recipesResponseModel => _recipesResponseModel;

  Timer? _debounce;

  RecipesParamsModel? _recipesRequestModel;

  int _upgradeIndex = 0;

  String _lastQuery = '';

  List<HealthType> _selectedHealthTypeList = [];

  List<HealthType> get selectedHealthTypeList => _selectedHealthTypeList;

  void setHealthType(List<HealthType> value) {
    _selectedHealthTypeList = value;
    notifyListeners();
    if (_lastQuery.isEmpty) {
      return;
    }
    onChangedSearch(_lastQuery);
  }

  void _updateFadeInUpKey() {
    fadeInUpKey = ValueKey('$_fadeInUpValue$_upgradeIndex');
    _upgradeIndex++;
  }

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      _onSearchClear.call();
    }
  }

  @override
  void init() {
    searchController = TextEditingController()..addListener(_onListenerSearch);
    searchHistoryController = InputHistoryController();
    animationType = AnimationPlayStates.Forward;
    _updateFadeInUpKey();
  }

  void onSearchClear() {
    if (searchController.text.isEmpty) {
      return;
    }
    searchController.clear();
    _lastQuery = searchController.text;
    animationType = AnimationPlayStates.Reverse;
    _updateFadeInUpKey();
    notifyListeners();
  }

  void _onSearchClear() {
    _recipesResponseModel = null;
  }

  void onRecipeDetail(int index) {
    navigationService.navigateToPage(
      route: RecipesDetailRoute(
        args: _recipesResponseModel!.hits![index].recipe!,
      ),
    );
  }

  Future<void> _searchRecipes() async {
    try {
      if (_recipesRequestModel == null) {
        return;
      }

      final responseModel = await _service.searchRecipes(
        _recipesRequestModel!,
      );

      _recipesResponseModel = responseModel;
      animationType = AnimationPlayStates.Forward;
      _updateFadeInUpKey();
    } catch (e, st) {
      logger.error('Error: $e, St: $st');
    } finally {
      setLoading(false);
    }
  }

  void _onListenerSearch() {
    if (searchController.text.isEmpty || searchController.text == _lastQuery) {
      return;
    }
    _lastQuery = searchController.text;
    searchController.selection = TextSelection.collapsed(
      offset: searchController.text.length,
    );
    onChangedSearch(_lastQuery);
  }

  void onChangedSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(viewModelContext.durationLow, () {
      _recipesRequestModel = RecipesParamsModel(
        q: query,
        health: _selectedHealthTypeList,
      );
      _searchRecipes.call();
    });
  }

  void onDispose() {
    searchController.removeListener(_onListenerSearch);
    _debounce?.cancel();
  }
}
