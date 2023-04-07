import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipes_app/core/base/view_model/base_view_model.dart';
import 'package:recipes_app/feature/_model/recipe_model.dart';
import 'package:recipes_app/feature/favorites/service/i_favorites_service.dart';
import 'package:recipes_app/feature/recipes/recipes_detail/service/i_recipes_detail_service.dart';
import 'package:recipes_app/product/init/navigation/navigation_router.dart';

class FavoritesViewModel extends BaseViewModel {
  FavoritesViewModel(this._service, this._serviceRecipes);

  final IFavoritesService _service;

  final IRecipesDetailService _serviceRecipes;

  List<RecipeModel> _favoritesList = [];

  List<RecipeModel> get favoritesList => _favoritesList;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    Future.microtask(() async {
      await _futureInitialize();
    });
  }

  Future<void> _futureInitialize() async {
    final tempList = (await _service.getAllFavorites()) ?? [];
    debugPrint('len: ${tempList.length}');
    _favoritesList = tempList.reversed.toList();
    notifyListeners();
  }

  Future<void> onRecipeDetail(int index) async {
    await navigationService.navigateToPage(
      route: RecipesDetailRoute(
        args: _favoritesList[index],
      ),
    );
    await _futureInitialize();
  }

  void deleteFavorites(int index) {
    _serviceRecipes.deleteFavorites(_favoritesList[index]);
    _futureInitialize();
  }
}
