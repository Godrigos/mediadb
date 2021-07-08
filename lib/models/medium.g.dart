// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medium.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhysicalStateAdapter extends TypeAdapter<PhysicalState> {
  @override
  final int typeId = 2;

  @override
  PhysicalState read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PhysicalState.solid;
      case 1:
        return PhysicalState.semisolid;
      case 2:
        return PhysicalState.liquid;
      case 3:
        return PhysicalState.undefined;
      default:
        return PhysicalState.solid;
    }
  }

  @override
  void write(BinaryWriter writer, PhysicalState obj) {
    switch (obj) {
      case PhysicalState.solid:
        writer.writeByte(0);
        break;
      case PhysicalState.semisolid:
        writer.writeByte(1);
        break;
      case PhysicalState.liquid:
        writer.writeByte(2);
        break;
      case PhysicalState.undefined:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhysicalStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MediumAdapter extends TypeAdapter<Medium> {
  @override
  final int typeId = 0;

  @override
  Medium read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Medium(
      initials: fields[0] as String,
      longName: fields[1] as String,
      ingredients: (fields[2] as Map).cast<String, Quantity>(),
      steps: (fields[3] as List).cast<String>(),
      mediumState: fields[5] as PhysicalState,
      reference: fields[4] as String,
      isComplement: fields[6] as bool,
      ps: fields[7] as String,
      isFavorite: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Medium obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.initials)
      ..writeByte(1)
      ..write(obj.longName)
      ..writeByte(2)
      ..write(obj.ingredients)
      ..writeByte(3)
      ..write(obj.steps)
      ..writeByte(4)
      ..write(obj.reference)
      ..writeByte(5)
      ..write(obj.mediumState)
      ..writeByte(6)
      ..write(obj.isComplement)
      ..writeByte(7)
      ..write(obj.ps)
      ..writeByte(8)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuantityAdapter extends TypeAdapter<Quantity> {
  @override
  final int typeId = 1;

  @override
  Quantity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Quantity(
      amount: fields[0] as double,
      unit: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Quantity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuantityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
