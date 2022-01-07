import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import '../source.dart';

class PlacesService {
  Future<String?> getAddress(LatLng location) async {
    var placemarks = <Placemark>[];
    try {
      placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
    } catch (_) {
      placemarks = [];
    }

    return placemarks.first.street ??
        placemarks.first.name ??
        placemarks.first.thoroughfare;
  }

  ///must enable billing for it to work,
  Future<dynamic> getPlaces(String place, LatLng location) async {
    final results = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$place&location=${location.latitude}C${location.longitude}&radius=500&types=establishment&key=$kApiKey'));
    final body = jsonDecode(results.body);

    log(body.toString());

    return body['predictions'];
  }
}
