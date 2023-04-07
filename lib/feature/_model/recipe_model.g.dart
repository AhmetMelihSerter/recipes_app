// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeModelAdapter extends TypeAdapter<RecipeModel> {
  @override
  final int typeId = 2;

  @override
  RecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeModel(
      identity: fields[23] as String?,
      uri: fields[0] as String?,
      label: fields[1] as String?,
      image: fields[2] as String?,
      source: fields[3] as String?,
      url: fields[4] as String?,
      shareAs: fields[5] as String?,
      dietLabels: (fields[6] as List?)?.cast<String>(),
      healthLabels: (fields[7] as List?)?.cast<String>(),
      cautions: (fields[8] as List?)?.cast<String>(),
      ingredientLines: (fields[9] as List?)?.cast<String>(),
      calories: fields[10] as double?,
      glycemicIndex: fields[11] as int?,
      totalCO2Emissions: fields[12] as int?,
      co2EmissionsClass: fields[13] as String?,
      totalWeight: fields[14] as double?,
      cuisineType: (fields[15] as List?)?.cast<String>(),
      mealType: (fields[16] as List?)?.cast<String>(),
      dishType: (fields[17] as List?)?.cast<String>(),
      instructions: (fields[18] as List?)?.cast<String>(),
      tags: (fields[19] as List?)?.cast<String>(),
      externalId: fields[20] as String?,
      digest: (fields[22] as List?)?.cast<DigestModel>(),
    )..yields = fields[21] as double?;
  }

  @override
  void write(BinaryWriter writer, RecipeModel obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.uri)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.source)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.shareAs)
      ..writeByte(6)
      ..write(obj.dietLabels)
      ..writeByte(7)
      ..write(obj.healthLabels)
      ..writeByte(8)
      ..write(obj.cautions)
      ..writeByte(9)
      ..write(obj.ingredientLines)
      ..writeByte(10)
      ..write(obj.calories)
      ..writeByte(11)
      ..write(obj.glycemicIndex)
      ..writeByte(12)
      ..write(obj.totalCO2Emissions)
      ..writeByte(13)
      ..write(obj.co2EmissionsClass)
      ..writeByte(14)
      ..write(obj.totalWeight)
      ..writeByte(15)
      ..write(obj.cuisineType)
      ..writeByte(16)
      ..write(obj.mealType)
      ..writeByte(17)
      ..write(obj.dishType)
      ..writeByte(18)
      ..write(obj.instructions)
      ..writeByte(19)
      ..write(obj.tags)
      ..writeByte(20)
      ..write(obj.externalId)
      ..writeByte(21)
      ..write(obj.yields)
      ..writeByte(22)
      ..write(obj.digest)
      ..writeByte(23)
      ..write(obj.identity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
      identity: json['identity'] as String?,
      uri: json['uri'] as String?,
      label: json['label'] as String?,
      image: json['image'] as String?,
      source: json['source'] as String?,
      url: json['url'] as String?,
      shareAs: json['shareAs'] as String?,
      dietLabels: (json['dietLabels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      healthLabels: (json['healthLabels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cautions: (json['cautions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ingredientLines: (json['ingredientLines'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      calories: (json['calories'] as num?)?.toDouble(),
      glycemicIndex: json['glycemicIndex'] as int?,
      totalCO2Emissions: json['totalCO2Emissions'] as int?,
      co2EmissionsClass: json['co2EmissionsClass'] as String?,
      totalWeight: (json['totalWeight'] as num?)?.toDouble(),
      cuisineType: (json['cuisineType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mealType: (json['mealType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dishType: (json['dishType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      instructions: (json['instructions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      externalId: json['externalId'] as String?,
      digest: (json['digest'] as List<dynamic>?)
          ?.map((e) => DigestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..yields = (json['yield'] as num?)?.toDouble();

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'identity': instance.identity,
      'uri': instance.uri,
      'label': instance.label,
      'image': instance.image,
      'source': instance.source,
      'url': instance.url,
      'shareAs': instance.shareAs,
      'dietLabels': instance.dietLabels,
      'healthLabels': instance.healthLabels,
      'cautions': instance.cautions,
      'ingredientLines': instance.ingredientLines,
      'calories': instance.calories,
      'glycemicIndex': instance.glycemicIndex,
      'totalCO2Emissions': instance.totalCO2Emissions,
      'co2EmissionsClass': instance.co2EmissionsClass,
      'totalWeight': instance.totalWeight,
      'cuisineType': instance.cuisineType,
      'mealType': instance.mealType,
      'dishType': instance.dishType,
      'instructions': instance.instructions,
      'tags': instance.tags,
      'externalId': instance.externalId,
      'yield': instance.yields,
      'digest': instance.digest,
    };
