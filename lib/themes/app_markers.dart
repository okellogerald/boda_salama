import '../source.dart';

class AppMarkers {
  static var _loadingPin = BitmapDescriptor.defaultMarker;
  static var _fixedPin = BitmapDescriptor.defaultMarker;
  static var _driverPin = BitmapDescriptor.defaultMarker;
  static var _darkDriverPin = BitmapDescriptor.defaultMarker;
  static var _locationPin = BitmapDescriptor.defaultMarker;

  static Future<void> createMarkers() async {
    _loadingPin = await getBitmapIcon('assets/images/custom-loading-pin.bmp');
    _fixedPin = await getBitmapIcon('assets/images/custom-pin.bmp');
    _driverPin = await getBitmapIcon('assets/images/driver-pin.bmp');
    _darkDriverPin = await getBitmapIcon('assets/images/dark_driver_pin.bmp');
    _locationPin = await getBitmapIcon('assets/images/location-marker.bmp');
  }

  static Future<BitmapDescriptor> getBitmapIcon(String imagePath) async {
    return await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), imagePath);
  }

  static BitmapDescriptor get getLoadingIcon => _loadingPin;
  static BitmapDescriptor get getFixedIcon => _fixedPin;
  static BitmapDescriptor get getDriverIcon => _driverPin;
  static BitmapDescriptor get getDarkDriverIcon => _darkDriverPin;
  static BitmapDescriptor get getLocationIcon => _locationPin;
}
