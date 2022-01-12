import 'dart:async';
import '../source.dart';

class DriverPageBloc extends Cubit<DriverPageState> {
  DriverPageBloc(this.locationsService, this.placesService, this.tripsService)
      : super(DriverPageState.initial());

  final LocationService locationsService;
  final PlacesService placesService;
  final TripsService tripsService;

  static const _driverId = MarkerId('driver');

  static const defaultDriver = Driver(
    age: 24,
    id: 'default_driver',
    distance: 250,
    name: 'Peter Mdau',
    image:
        'https://image.freepik.com/free-photo/handsome-man-smiling-happy-face-portrait-close-up_53876-146189.jpg',
    rating: 4.0,
    position: LatLng(-6.773693, 39.224214),
  );

  var _driverMarker = const Marker(markerId: _driverId);

  void init(Completer<GoogleMapController> controller) async {
    var supp = state.supplements;
    emit(DriverPageState.loading(supp));

    await AppMapStyling.loadMapStyles();
    final trips = await _getTrips();
    var driver = tripsService.getDriver;
    final driverIsNotSelected = driver.position.latitude == 0.0;
    if (driverIsNotSelected) driver = defaultDriver;

    final marker = Marker(
      markerId: _driverId,
      position: driver.position,
      icon: AppMarkers.getDarkDriverIcon,
    );

    _driverMarker = marker;
    final _controller = await controller.future;
    _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: driver.position, zoom: 16.25)));
    supp = supp.copyWith(
        driver: driver, markers: [marker], trips: trips, isOffline: false);
    emit(DriverPageState.content(supp));
  }

  void toggleStatus(Completer<GoogleMapController> controller) async {
    var supp = state.supplements;
    emit(DriverPageState.loading(supp));

    final trips = supp.isOffline ? await _getTrips() : <Trip>[];

    final _controller = await controller.future;
    if (supp.isOffline) {
      final driverMarker = Marker(
        markerId: _driverMarker.markerId,
        position: _driverMarker.position,
        icon: AppMarkers.getDarkDriverIcon,
      );
      supp = supp.copyWith(markers: [driverMarker], currentIndex: 0);
      _controller.setMapStyle('[]');
    } else {
      _driverMarker = Marker(
        markerId: _driverMarker.markerId,
        position: _driverMarker.position,
        icon: AppMarkers.getDriverIcon,
      );
      supp = supp.copyWith(markers: [_driverMarker]);
      _controller.setMapStyle(AppMapStyling.getDarkStyle);
    }

    supp = supp.copyWith(isOffline: !supp.isOffline, trips: trips);
    emit(DriverPageState.content(supp));
  }

  Future<List<Trip>> _getTrips() async {
    var driver = tripsService.getDriver;
    final driverIsNotSelected = driver.position.latitude == 0.0;
    if (driverIsNotSelected) driver = defaultDriver;
    final position = driver.position;

    final trips = <Trip>[];

    final customerPoints = await locationsService.generateRandomLocationData(
        300, position.latitude, position.longitude,
        numberOfResults: 5);

    final realTrip = tripsService.getRealTrip();
    if (realTrip != null) trips.add(realTrip);

    for (LatLng point in customerPoints) {
      final index = customerPoints.indexOf(point);
      final name = kNames[index];
      final image = kImages[index];
      final address = await placesService.getAddress(point) ?? '';
      final location = Location(address: address, point: point);
      final distance = locationsService.calcDistance(point, position);
      final trip =
          tripsService.getTripFrom(driver, location, distance, name, image);
      trips.add(trip);
    }

    tripsService.updateTrips(trips);
    return trips;
  }

  void refreshMap(Completer<GoogleMapController> mapController) async {
    var supp = state.supplements;
    emit(DriverPageState.loading(supp));
    log('resuming from the driver page');
    final controller = await mapController.future;
    if (!supp.isOffline) {
      controller.setMapStyle('[]');
    } else {
      controller.setMapStyle(AppMapStyling.getDarkStyle);
    }
    emit(DriverPageState.content(supp));
  }

  void updateIndex({bool isGoingForward = true}) {
    var supp = state.supplements;
    emit(DriverPageState.loading(supp));
    var index = supp.currentIndex;
    if (isGoingForward) {
      index = index + 1;
    } else {
      index = index - 1;
    }
    supp = supp.copyWith(currentIndex: index);
    emit(DriverPageState.content(supp));
  }

  void viewOnMap(String tripId) {
    var supp = state.supplements;
    emit(DriverPageState.loading(supp));
    final trip = supp.trips.where((e) => e.tripId == tripId).first;
    final marker = Marker(
      markerId: const MarkerId('customer'),
      position: LatLng(trip.pickUpLatitude, trip.pickUpLongitude),
      icon: AppMarkers.getLocationIcon,
    );
    final driverMarker = Marker(
      markerId: _driverMarker.markerId,
      position: _driverMarker.position,
      icon: AppMarkers.getDarkDriverIcon,
    );
    supp = supp.copyWith(markers: [marker, driverMarker]);
    emit(DriverPageState.content(supp));
  }

  void ignore(String tripId) {
    var supp = state.supplements;
    emit(DriverPageState.loading(supp));
    final lastIndex = supp.trips.length - 1;
    final index =
        supp.currentIndex == lastIndex ? lastIndex - 1 : supp.currentIndex;
    final trips = tripsService.deleteTrip(tripId);
    supp = supp.copyWith(currentIndex: index, trips: trips);
    emit(DriverPageState.content(supp));
  }
}
