import 'dart:async';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../source.dart';

class TripsService {
  final box = Hive.box(kTripDetailsBox);
  static const uuid = Uuid();
  var _trips = <Trip>[];
  var _driver = Driver.empty();

  final _tripsController = StreamController<List<Trip>>.broadcast();
  Stream<List<Trip>> get getTripStream => _tripsController.stream;

  bool get isEmpty => box.isEmpty;
  Driver get getDriver => _driver;

  Future<void> addTrip(
      {required Driver driver,
      required Location location,
      bool isReal = false}) async {
    final id = uuid.v4();
    final trip = Trip(
      tripId: id,
      pickUpAddress: location.address,
      isReal: isReal,
      distance: driver.distance,
      timeAway: driver.getTimeAway,
      pickUpLatitude: location.point.latitude,
      pickUpLongitude: location.point.longitude,
      driverLatitude: driver.position.latitude,
      driverLongitude: driver.position.longitude,
      driverAge: driver.age,
      driverName: driver.name,
      driverRating: driver.rating,
      driverImage: driver.image,
      customerName: 'Angela Smith',
      customerImage:
          'https://images.pexels.com/photos/1535437/pexels-photo-1535437.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      requestTime: DateTime.now(),
    );
    final realIndex = _trips.indexWhere((e) => e.isReal == true);
    if (realIndex != -1 && isReal) {
      await box.delete(_trips[realIndex].tripId);
      _trips.removeAt(realIndex);
    }
    _driver = driver;
    _trips.add(trip);
    await box.put(id, trip);
    _tripsController.add(_trips);
  }

  List<Trip> deleteTrip(String tripId) {
    _trips.removeWhere((e) => e.tripId == tripId);
    return _trips;
  }

  Trip? getRealTrip() {
    final index = _trips.indexWhere((e) => e.isReal == true);
    if (index == -1) {
      //no real trip has been added by tapping on select this driver button.
      //we add one.
      return null;
    }
    final trip = _trips[index];
    return trip;
  }

  void updateTrips(List<Trip> trips) => _trips = trips;

  Trip getTripFrom(Driver driver, Location location, double distance,
      String name, String image) {
    final id = uuid.v4();

    var timeAway = ((distance / 500) * 10).toInt();
    if (timeAway == 0) timeAway = 1;

    final trip = Trip(
      tripId: id,
      pickUpAddress: location.address,
      isReal: false,
      distance: distance,
      timeAway: timeAway,
      pickUpLatitude: location.point.latitude,
      pickUpLongitude: location.point.longitude,
      driverLatitude: driver.position.latitude,
      driverLongitude: driver.position.longitude,
      driverAge: driver.age,
      driverName: driver.name,
      driverRating: driver.rating,
      driverImage: driver.image,
      customerName: name,
      customerImage: image,
      requestTime: DateTime.now(),
    );
    return trip;
  }
}
