// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TripAdapter extends TypeAdapter<Trip> {
  @override
  final int typeId = 0;

  @override
  Trip read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Trip(
      pickUpAddress: fields[0] as String,
      pickUpLatitude: fields[2] as double,
      pickUpLongitude: fields[3] as double,
      requestTime: fields[4] as DateTime,
      timeAway: fields[13] as int,
      tripId: fields[5] as String,
      isReal: fields[1] as bool,
      driverAge: fields[8] as int,
      distance: fields[11] as double,
      driverImage: fields[6] as String,
      customerName: fields[14] as String,
      driverLatitude: fields[9] as double,
      driverLongitude: fields[10] as double,
      driverName: fields[7] as String,
      driverRating: fields[12] as double,
      customerImage: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Trip obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.pickUpAddress)
      ..writeByte(1)
      ..write(obj.isReal)
      ..writeByte(2)
      ..write(obj.pickUpLatitude)
      ..writeByte(3)
      ..write(obj.pickUpLongitude)
      ..writeByte(4)
      ..write(obj.requestTime)
      ..writeByte(5)
      ..write(obj.tripId)
      ..writeByte(6)
      ..write(obj.driverImage)
      ..writeByte(7)
      ..write(obj.driverName)
      ..writeByte(8)
      ..write(obj.driverAge)
      ..writeByte(9)
      ..write(obj.driverLatitude)
      ..writeByte(10)
      ..write(obj.driverLongitude)
      ..writeByte(11)
      ..write(obj.distance)
      ..writeByte(12)
      ..write(obj.driverRating)
      ..writeByte(13)
      ..write(obj.timeAway)
      ..writeByte(14)
      ..write(obj.customerName)
      ..writeByte(15)
      ..write(obj.customerImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TripAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
