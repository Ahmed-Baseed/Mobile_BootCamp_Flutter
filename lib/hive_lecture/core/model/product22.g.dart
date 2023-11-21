// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product22.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Product2Adapter extends TypeAdapter<Product2> {
  @override
  final int typeId = 1;

  @override
  Product2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product2(
      id: fields[0] as int?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      price: fields[3] as int?,
      stock: fields[4] as int?,
      brand: fields[5] as String?,
      category: fields[6] as String?,
      thumbnail: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Product2 obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.stock)
      ..writeByte(5)
      ..write(obj.brand)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product2Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
