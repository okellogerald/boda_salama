import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  final String address;
  final LatLng point;

  Location({required this.address, required this.point});

  factory Location.empty() => Location(address: '', point: const LatLng(0, 0));
}
