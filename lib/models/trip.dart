import 'package:hive/hive.dart';

part 'trip.g.dart';

@HiveType(typeId: 0)
class Trip extends HiveObject {
  @HiveField(0)
  final String pickUpAddress;

  ///the only real trip is the one placed by the user by selecting the driver.
  ///all others are fake, generated when the driver loads the trips to take.
  @HiveField(1)
  final bool isReal;

  @HiveField(2)
  final double pickUpLatitude;

  @HiveField(3)
  final double pickUpLongitude;

  @HiveField(4)
  final DateTime requestTime;

  @HiveField(5)
  final String tripId;

  @HiveField(6)
  final String driverImage;

  @HiveField(7)
  final String driverName;

  @HiveField(8)
  final int driverAge;

  @HiveField(9)
  final double driverLatitude;

  @HiveField(10)
  final double driverLongitude;

  @HiveField(11)
  final double distance;

  @HiveField(12)
  final double driverRating;

  @HiveField(13)
  final int timeAway;

  @HiveField(14)
  final String customerName;

  @HiveField(15)
  final String customerImage;

  Trip({
    required this.pickUpAddress,
    required this.pickUpLatitude,
    required this.pickUpLongitude,
    required this.requestTime,
    required this.timeAway,
    required this.tripId,
    required this.isReal,
    required this.driverAge,
    required this.distance,
    required this.driverImage,
    required this.customerName,
    required this.driverLatitude,
    required this.driverLongitude,
    required this.driverName,
    required this.driverRating,
    required this.customerImage,
  });

  factory Trip.empty() => Trip(
        pickUpAddress: '',
        pickUpLatitude: 0,
        pickUpLongitude: 0,
        requestTime: DateTime.now(),
        tripId: '',
        isReal: false,
        customerName: '',
        driverAge: 0,
        distance: 0,
        timeAway: 0,
        driverLongitude: 0,
        driverLatitude: 0,
        driverName: '',
        driverRating: 0,
        driverImage: '',
        customerImage: '',
      );
}
