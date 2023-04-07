import 'package:injectable/injectable.dart';
import 'package:recipes_app/feature/recipes/recipes_sub/model/recipes_params_model.dart';
import 'package:recipes_app/feature/recipes/recipes_sub/model/recipes_response_model.dart';
import 'package:recipes_app/feature/recipes/recipes_sub/service/i_recipes_service.dart';

@Injectable(as: IRecipesService)
class RecipesService extends IRecipesService {
  RecipesService(super.networkManager, super.storageManager);

  String get _searchRecipesRoute => 'recipes/v2/';

  @override
  Future<RecipesResponseModel?> searchRecipes(RecipesParamsModel model) async {
    final response = await networkManager.send(
      _searchRecipesRoute,
      parseModel: RecipesResponseModel(),
      queryParameters: model.toJson(),
    );
    return response;
  }
}
