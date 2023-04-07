import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recipes_app/core/base/model/base_storage_model.dart';
import 'package:recipes_app/feature/_model/digest_model.dart';

part 'recipe_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class RecipeModel extends BaseStorageModel<RecipeModel> with EquatableMixin {
  RecipeModel({
    super.identity,
    this.uri,
    this.label,
    this.image,
    this.source,
    this.url,
    this.shareAs,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.calories,
    this.glycemicIndex,
    this.totalCO2Emissions,
    this.co2EmissionsClass,
    this.totalWeight,
    this.cuisineType,
    this.mealType,
    this.dishType,
    this.instructions,
    this.tags,
    this.externalId,
    this.digest,
  });

  factory RecipeModel.fromJson(Map<String, Object?> json) {
    return _$RecipeModelFromJson(json);
  }

  @override
  String get tableName => 'recipes';

  @override
  List<Object?> get props => [label, url];

  @HiveField(23)
  @override
  String get identity => super.identity;

  String get joinedLabels => [
        ...dietLabels ?? [],
        ...healthLabels ?? [],
      ].join(' • ');

  DigestModel? get protein => _getDigest('PROCNT');

  DigestModel? get carboHydrate => _getDigest('CHOCDF');

  DigestModel? get fat => _getDigest('FAT');

  DigestModel? get cholesterol => _getDigest('CHOLE');

  DigestModel? get sodium => _getDigest('NA');

  DigestModel? get calcium => _getDigest('CA');

  DigestModel? get magnesium => _getDigest('MG');

  DigestModel? get potassium => _getDigest('K');

  DigestModel? get iron => _getDigest('FE');

  DigestModel? _getDigest(String tag) {
    final model = digest?.firstWhereOrNull((element) => element.tag == tag);
    return model;
  }

  int? get kCal => (calories ?? 0) ~/ (yields ?? 1);

  @HiveField(0)
  String? uri;
  @HiveField(1)
  String? label;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? source;
  @HiveField(4)
  String? url;
  @HiveField(5)
  String? shareAs;
  @HiveField(6)
  List<String>? dietLabels;
  @HiveField(7)
  List<String>? healthLabels;
  @HiveField(8)
  List<String>? cautions;
  @HiveField(9)
  List<String>? ingredientLines;
  @HiveField(10)
  double? calories;
  @HiveField(11)
  int? glycemicIndex;
  @HiveField(12)
  int? totalCO2Emissions;
  @HiveField(13)
  String? co2EmissionsClass;
  @HiveField(14)
  double? totalWeight;
  @HiveField(15)
  List<String>? cuisineType;
  @HiveField(16)
  List<String>? mealType;
  @HiveField(17)
  List<String>? dishType;
  @HiveField(18)
  List<String>? instructions;
  @HiveField(19)
  List<String>? tags;
  @HiveField(20)
  String? externalId;
  @HiveField(21)
  @JsonKey(name: 'yield')
  double? yields;
  @HiveField(22)
  List<DigestModel>? digest;

  @override
  RecipeModel fromJson(Map<String, Object?> json) {
    return RecipeModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$RecipeModelToJson(this);
  }

  @override
  String toString() {
    return 'RecipeModel(uri: $uri, label: $label, image: $image, source: $source, url: $url, shareAs: $shareAs, dietLabels: $dietLabels, healthLabels: $healthLabels, cautions: $cautions, ingredientLines: $ingredientLines, calories: $calories, glycemicIndex: $glycemicIndex, totalCO2Emissions: $totalCO2Emissions, co2EmissionsClass: $co2EmissionsClass, totalWeight: $totalWeight, cuisineType: $cuisineType, mealType: $mealType, dishType: $dishType, instructions: $instructions, tags: $tags, externalId: $externalId)';
  }
}
