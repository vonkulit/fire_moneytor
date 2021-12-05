// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'construct_income.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IncomeAdapter extends TypeAdapter<Income> {
  @override
  final int typeId = 3;

  @override
  Income read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Income(
      workName: fields[0] as String,
      category: fields[1] as String,
      incomeAmount: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Income obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.workName)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.incomeAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
