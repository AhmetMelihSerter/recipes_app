// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digest_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DigestModelAdapter extends TypeAdapter<DigestModel> {
  @override
  final int typeId = 3;

  @override
  DigestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DigestModel(
      identity: fields[7] as String?,
      label: fields[0] as String?,
      tag: fields[1] as String?,
      schemaOrgTag: fields[2] as String?,
      total: fields[3] as double?,
      hasRDI: fields[4] as bool?,
      daily: fields[5] as double?,
      unit: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DigestModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.tag)
      ..writeByte(2)
      ..write(obj.schemaOrgTag)
      ..writeByte(3)
      ..write(obj.total)
      ..writeByte(4)
      ..write(obj.hasRDI)
      ..writeByte(5)
      ..write(obj.daily)
      ..writeByte(6)
      ..write(obj.unit)
      ..writeByte(7)
      ..write(obj.identity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DigestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DigestModel _$DigestModelFromJson(Map<String, dynamic> json) => DigestModel(
      identity: json['identity'] as String?,
      label: json['label'] as String?,
      tag: json['tag'] as String?,
      schemaOrgTag: json['schemaOrgTag'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      hasRDI: json['hasRDI'] as bool?,
      daily: (json['daily'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$DigestModelToJson(DigestModel instance) =>
    <String, dynamic>{
      'identity': instance.identity,
      'label': instance.label,
      'tag': instance.tag,
      'schemaOrgTag': instance.schemaOrgTag,
      'total': instance.total,
      'hasRDI': instance.hasRDI,
      'daily': instance.daily,
      'unit': instance.unit,
    };
