// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipesResponseModel _$RecipesResponseModelFromJson(
        Map<String, dynamic> json) =>
    RecipesResponseModel(
      from: json['from'] as int?,
      to: json['to'] as int?,
      count: json['count'] as int?,
      hits: (json['hits'] as List<dynamic>?)
          ?.map((e) => HitsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipesResponseModelToJson(
        RecipesResponseModel instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'count': instance.count,
      'hits': instance.hits,
    };
