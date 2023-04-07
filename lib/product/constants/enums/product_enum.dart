import 'package:json_annotation/json_annotation.dart';

enum RecipesSearchType {
  public,
  user,
  any,
}

enum HealthType {
  vegan,
  vegetarian,
  @JsonValue('gluten-free')
  glutenFree,
}
