import 'package:flutter/material.dart';
import 'package:recipes_app/core/base/view_model/base_view_model.dart';
import 'package:recipes_app/feature/_model/recipe_model.dart';
import 'package:recipes_app/feature/recipes/recipes_detail/service/i_recipes_detail_service.dart';
import 'package:recipes_app/feature/recipes/recipes_source/model/recipes_source_args.dart';
import 'package:recipes_app/product/init/navigation/navigation_router.dart';
import 'package:share_plus/share_plus.dart';

class RecipesDetailViewModel extends BaseViewModel {
  RecipesDetailViewModel(this._service);

  final IRecipesDetailService _service;

  late final RecipeModel recipeModel;

  bool isFavorite = false;

  List<bool> _foldOutList = [];

  List<bool> get foldOutList => _foldOutList;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  void setArgs(RecipeModel args) {
    recipeModel = args;
  }

  @override
  void init() {
    Future.microtask(() async {
      await _futureInitialize();
    });
  }

  Future<void> _futureInitialize() async {
    try {
      _foldOutList = List.filled(
        recipeModel.ingredientLines?.length ?? 0,
        false,
      );
      await _checkFavorites();
    } catch (e) {
      logger.error('Error: $e');
    } finally {
      notifyListeners();
    }
  }

  void onPressedFoldingCard(int index, {bool isClose = false}) {
    _foldOutList[index] = isClose;
    notifyListeners();
  }

  Future<void> _checkFavorites() async {
    isFavorite = await _service.equalFavorites(recipeModel);
  }

  void onTapFavorites() {
    if (isFavorite) {
      _deleteFavorites();
    } else {
      _addFavorites();
    }
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void _addFavorites() {
    _service.addFavorites(recipeModel);
  }

  void _deleteFavorites() {
    _service.deleteFavorites(recipeModel);
  }

  void shareNews() {
    if (recipeModel.url == null) {
      return;
    }
    Share.share(recipeModel.url!);
  }

  void onSource() {
    if (recipeModel.url == null) {
      return;
    }
    navigationService.navigateToPage(
      route: RecipesSourceRoute(
        args: RecipesSourceArgs(
          url: recipeModel.url!,
        ),
      ),
    );
  }
}
