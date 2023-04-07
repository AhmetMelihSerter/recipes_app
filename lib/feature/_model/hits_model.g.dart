// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hits_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HitsModel _$HitsModelFromJson(Map<String, dynamic> json) => HitsModel(
      recipe: json['recipe'] == null
          ? null
          : RecipeModel.fromJson(json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HitsModelToJson(HitsModel instance) => <String, dynamic>{
      'recipe': instance.recipe,
    };
