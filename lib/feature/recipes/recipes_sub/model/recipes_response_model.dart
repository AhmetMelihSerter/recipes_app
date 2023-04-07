import 'package:json_annotation/json_annotation.dart';
import 'package:recipes_app/core/base/model/base_model_response.dart';
import 'package:recipes_app/feature/_model/hits_model.dart';

part 'recipes_response_model.g.dart';

@JsonSerializable()
class RecipesResponseModel extends BaseModelResponse<RecipesResponseModel> {
  RecipesResponseModel({
    super.from,
    super.to,
    super.count,
    this.hits,
  });

  factory RecipesResponseModel.fromJson(Map<String, Object?> json) {
    return _$RecipesResponseModelFromJson(json);
  }

  List<HitsModel>? hits;

  @override
  RecipesResponseModel fromJson(Map<String, Object?> json) {
    return RecipesResponseModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$RecipesResponseModelToJson(this);
  }
}
