import 'package:recipes_app/core/base/service/base_service.dart';
import 'package:recipes_app/feature/_model/recipe_model.dart';

abstract class IFavoritesService extends BaseService {
  IFavoritesService(super.networkManager, super.storageManager);

  Future<List<RecipeModel>?> getAllFavorites();
  Future<void> deleteFavorites(RecipeModel model);
}
