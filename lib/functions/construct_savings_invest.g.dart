// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'construct_savings_invest.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavingsInvestmentsAdapter extends TypeAdapter<SavingsInvestments> {
  @override
  final int typeId = 2;

  @override
  SavingsInvestments read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavingsInvestments(
      name: fields[0] as String,
      savings: fields[2] as double,
      category: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavingsInvestments obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.savings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavingsInvestmentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
