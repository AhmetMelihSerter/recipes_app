import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:recipes_app/core/base/model/base_storage_model.dart';

part 'digest_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class DigestModel extends BaseStorageModel<DigestModel> with EquatableMixin {
  DigestModel({
    super.identity,
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRDI,
    this.daily,
    this.unit,
  });

  factory DigestModel.fromJson(Map<String, Object?> json) {
    return _$DigestModelFromJson(json);
  }

  int? get totalValue => total?.toInt();

  @override
  String get tableName => 'digests';

  @override
  List<Object?> get props => [label, tag, unit];

  @HiveField(7)
  @override
  String get identity => super.identity;

  @HiveField(0)
  String? label;
  @HiveField(1)
  String? tag;
  @HiveField(2)
  String? schemaOrgTag;
  @HiveField(3)
  double? total;
  @HiveField(4)
  bool? hasRDI;
  @HiveField(5)
  double? daily;
  @HiveField(6)
  String? unit;

  @override
  DigestModel fromJson(Map<String, Object?> json) {
    return DigestModel.fromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$DigestModelToJson(this);
  }

  @override
  String toString() {
    return 'DigestModel(label: $label, tag: $tag, schemaOrgTag: $schemaOrgTag, total: $total, hasRDI: $hasRDI, daily: $daily, unit: $unit)';
  }

}
