import 'package:json_annotation/json_annotation.dart';
import 'package:recipes_app/core/base/model/base_model.dart';
import 'package:recipes_app/feature/_model/recipe_model.dart';

part 'hits_model.g.dart';

@JsonSerializable()
class HitsModel extends BaseModel<HitsModel> {
  HitsModel({
    this.recipe,
  });

  factory HitsModel.fromJson(Map<String, Object?> json) {
    return _$HitsModelFromJson(json);
  }

  RecipeModel? recipe;

  @override
  HitsModel fromJson(Map<String, Object?> json) {
    return HitsModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$HitsModelToJson(this);
  }

  @override
  String toString() => 'HitsModel(recipe: $recipe)';
}
