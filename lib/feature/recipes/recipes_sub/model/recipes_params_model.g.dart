// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipesParamsModel _$RecipesParamsModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['health'],
  );
  return RecipesParamsModel(
    q: json['q'] as String?,
    type: $enumDecodeNullable(_$RecipesSearchTypeEnumMap, json['type']) ??
        RecipesSearchType.public,
    health: (json['health'] as List<dynamic>)
        .map((e) => $enumDecode(_$HealthTypeEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$RecipesParamsModelToJson(RecipesParamsModel instance) =>
    <String, dynamic>{
      'q': instance.q,
      'type': _$RecipesSearchTypeEnumMap[instance.type]!,
      'health': instance.health.map((e) => _$HealthTypeEnumMap[e]!).toList(),
    };

const _$RecipesSearchTypeEnumMap = {
  RecipesSearchType.public: 'public',
  RecipesSearchType.user: 'user',
  RecipesSearchType.any: 'any',
};

const _$HealthTypeEnumMap = {
  HealthType.vegan: 'vegan',
  HealthType.vegetarian: 'vegetarian',
  HealthType.glutenFree: 'gluten-free',
};
