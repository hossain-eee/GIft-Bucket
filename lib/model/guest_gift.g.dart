// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_gift.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GuestGiftAdapter extends TypeAdapter<GuestGift> {
  @override
  final int typeId = 2;

  @override
  GuestGift read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GuestGift(
      name: fields[0] as String,
      gender: fields[1] as Gender,
      amount: fields[2] as int,
      noOfGift: fields[3] as int,
    )..giftType = fields[4] as GiftType;
  }

  @override
  void write(BinaryWriter writer, GuestGift obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.noOfGift)
      ..writeByte(4)
      ..write(obj.giftType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuestGiftAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenderAdapter extends TypeAdapter<Gender> {
  @override
  final int typeId = 0;

  @override
  Gender read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Gender.male;
      case 1:
        return Gender.female;
      default:
        return Gender.male;
    }
  }

  @override
  void write(BinaryWriter writer, Gender obj) {
    switch (obj) {
      case Gender.male:
        writer.writeByte(0);
        break;
      case Gender.female:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GiftTypeAdapter extends TypeAdapter<GiftType> {
  @override
  final int typeId = 1;

  @override
  GiftType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GiftType.money;
      case 1:
        return GiftType.gift;
      case 2:
        return GiftType.combo;
      default:
        return GiftType.money;
    }
  }

  @override
  void write(BinaryWriter writer, GiftType obj) {
    switch (obj) {
      case GiftType.money:
        writer.writeByte(0);
        break;
      case GiftType.gift:
        writer.writeByte(1);
        break;
      case GiftType.combo:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiftTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
