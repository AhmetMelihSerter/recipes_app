import 'package:injectable/injectable.dart';
import 'package:recipes_app/feature/_model/recipe_model.dart';
import 'package:recipes_app/feature/recipes/recipes_detail/service/i_recipes_detail_service.dart';

@Injectable(as: IRecipesDetailService)
class RecipesDetailService extends IRecipesDetailService {
  RecipesDetailService(super.networkManager, super.storageManager);

  @override
  Future<void> addFavorites(RecipeModel model) async {
    await storageManager.write(parseModel: model);
  }

  @override
  Future<void> deleteFavorites(RecipeModel model) async {
    await storageManager.delete(parseModel: model);
  }

  @override
  Future<bool> equalFavorites(RecipeModel model) async {
    final favoritesList = await storageManager.readAll(parseModel: model);
    return favoritesList.map((e) => e).contains(model);
  }
}
