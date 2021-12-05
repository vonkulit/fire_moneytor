// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'construct_spending.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpendingsAdapter extends TypeAdapter<Spendings> {
  @override
  final int typeId = 1;

  @override
  Spendings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Spendings(
      item: fields[0] as String,
      category: fields[1] as String,
      price: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Spendings obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.item)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpendingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
