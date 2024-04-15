// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_favorites.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerFavoritesAdapter extends TypeAdapter<CustomerFavorites> {
  @override
  final int typeId = 1;

  @override
  CustomerFavorites read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerFavorites(
      customerId: fields[0] as int,
      favorites: (fields[1] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, CustomerFavorites obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.customerId)
      ..writeByte(1)
      ..write(obj.favorites);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerFavoritesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
