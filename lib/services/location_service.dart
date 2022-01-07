import 'dart:math';

import 'package:boda_salama/source.dart' hide Location;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

class LocationService {
  static final location = Location();

  Future<bool> isLocationEnabled() async => await location.serviceEnabled();

  Future<bool> requestService() async => await location.requestService();

  Future<bool> isPermissionGranted() async {
    final permissionStatus = await location.hasPermission();
    return permissionStatus == PermissionStatus.granted ||
        permissionStatus == PermissionStatus.grantedLimited;
  }

  Future<bool> requestPermission() async {
    final permissionStatus = await location.requestPermission();
    return permissionStatus == PermissionStatus.granted ||
        permissionStatus == PermissionStatus.grantedLimited;
  }

  Future<LocationData> getCurrentLocation() async =>
      await location.getLocation();

  double _toEarthPointsFormat(double point) {
    final earthPoint = point.toStringAsFixed(7);
    return double.parse(earthPoint);
  }

  Future<List<LatLng>> generateRandomLocationData(
      double radius, double latitude, double longitude,
      {int? numberOfResults}) async {
    final locationList = <LatLng>[];
    final random = Random();

    final results = numberOfResults ?? 9 + random.nextInt(6);

    while (locationList.length <= results) {
      final _theta = random.nextDouble();
      final _radius = random.nextDouble();

      //using polar coordinates
      final polarTheta = _theta * 2 * pi;
      final polarRadius = radius / 111045 * sqrt(_radius);

      final xCartesian = polarRadius * cos(polarTheta);
      final yCartesian = polarRadius * sin(polarTheta);

      final gLatitude = _toEarthPointsFormat(latitude + xCartesian);
      final gLongitude = _toEarthPointsFormat(longitude + yCartesian);

      locationList.add(LatLng(gLatitude, gLongitude));
    }

    return locationList;
  }

  double calcDistance(LatLng point1, LatLng point2) {
    const k1 = 0.017453292519943295; // Math.PI / 180;
    const k2 = 12742000; //radius of the earth * 2;

    final latitude1 = point1.latitude;
    final longitude1 = point1.longitude;
    final latitude2 = point2.latitude;
    final longitude2 = point2.longitude;

    var a = 0.5 -
        cos((latitude2 - latitude1) * k1) / 2 +
        cos(latitude1 * k1) *
            cos(latitude2 * k1) *
            (1 - cos((longitude2 - longitude1) * k1)) /
            2;

    return k2 * asin(sqrt(a));
  }

  ///till when you have enabled the billing on your account.
  Future<Polyline> getPolyline(LatLng origin, LatLng destination) async {
    List<LatLng> polylineCoordinates = [];

    PolylinePoints polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      kApiKey,
      PointLatLng(origin.latitude, origin.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (PointLatLng point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {}

    const id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: AppColors.accentColor,
      points: polylineCoordinates,
      width: 8,
    );

    return polyline;
  }
}
