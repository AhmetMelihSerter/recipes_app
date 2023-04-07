import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:recipes_app/feature/_model/recipe_model.dart';
import 'package:recipes_app/feature/favorites/service/i_favorites_service.dart';

@Injectable(as: IFavoritesService)
class FavoritesService extends IFavoritesService {
  FavoritesService(super.networkManager, super.storageManager);

  @override
  Future<List<RecipeModel>?> getAllFavorites() async {
    final result = await storageManager.readAll(parseModel: RecipeModel());
    for (final element in result) {
      debugPrint('id: ${element.identity}');
    }
    return result.reversed.toList();
  }

  @override
  Future<void> deleteFavorites(RecipeModel model) async {
    debugPrint('id del: ${model.identity}');
    await storageManager.delete(parseModel: model);
  }
}
