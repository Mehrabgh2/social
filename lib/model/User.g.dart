// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      gender: fields[0] as String,
      name: fields[1] as Name,
      location: fields[2] as Location,
      email: fields[3] as String,
      dob: fields[4] as Dob,
      phone: fields[5] as String,
      cell: fields[6] as String,
      picture: fields[7] as Picture,
      nat: fields[8] as String,
    )..followController = fields[9] as FollowController;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.gender)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.dob)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.cell)
      ..writeByte(7)
      ..write(obj.picture)
      ..writeByte(8)
      ..write(obj.nat)
      ..writeByte(9)
      ..write(obj.followController);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
