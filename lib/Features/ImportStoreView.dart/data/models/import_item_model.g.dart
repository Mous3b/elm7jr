// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImportItemModelAdapter extends TypeAdapter<ImportItemModel> {
  @override
  final int typeId = 3;

  @override
  ImportItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImportItemModel(
      name: fields[0] as String?,
      qty: fields[1] as int?,
      price: fields[2] as double?,
      description: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImportItemModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.qty)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImportItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
