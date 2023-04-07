import 'package:recipes_app/core/base/service/base_service.dart';
import 'package:recipes_app/feature/_model/recipe_model.dart';

abstract class IRecipesDetailService extends BaseService {
  IRecipesDetailService(super.networkManager, super.storageManager);

  Future<bool> equalFavorites(RecipeModel model);
  Future<void> addFavorites(RecipeModel model);
  Future<void> deleteFavorites(RecipeModel model);
}
