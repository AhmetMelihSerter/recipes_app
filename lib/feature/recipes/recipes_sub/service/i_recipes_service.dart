import 'package:recipes_app/core/base/service/base_service.dart';
import 'package:recipes_app/feature/recipes/recipes_sub/model/recipes_params_model.dart';
import 'package:recipes_app/feature/recipes/recipes_sub/model/recipes_response_model.dart';

abstract class IRecipesService extends BaseService {
  IRecipesService(super.networkManager, super.storageManager);

  Future<RecipesResponseModel?> searchRecipes(RecipesParamsModel model);
}
