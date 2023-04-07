import 'package:json_annotation/json_annotation.dart';
import 'package:recipes_app/core/base/model/base_model.dart';
import 'package:recipes_app/product/constants/enums/product_enum.dart';

part 'recipes_params_model.g.dart';

@JsonSerializable()
class RecipesParamsModel extends BaseModel<RecipesParamsModel> {
  RecipesParamsModel({
    this.q,
    this.type = RecipesSearchType.public,
    required this.health,
  });

  factory RecipesParamsModel.fromJson(Map<String, Object?> json) {
    return _$RecipesParamsModelFromJson(json);
  }

  String? q;
  RecipesSearchType type;
  @JsonKey(disallowNullValue: true)
  List<HealthType> health;

  @override
  RecipesParamsModel fromJson(Map<String, Object?> json) {
    return RecipesParamsModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$RecipesParamsModelToJson(this);
  }
}
