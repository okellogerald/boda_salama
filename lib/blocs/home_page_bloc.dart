import 'dart:async';
import '../source.dart';

class HomePageBloc extends Cubit<HomePageState> {
  HomePageBloc(this.service, this.placesService, this.tripsService)
      : super(HomePageState.initial()) {
    _checkTrip();
  }

  final LocationService service;
  final PlacesService placesService;
  final TripsService tripsService;

  static const userMarkerId = 'current_user_id';
  var _markers = <Marker>[];

  var userMarkerid = const MarkerId(userMarkerId);

  void init({Location? location}) async {
    var supp = state.supplements;
    emit(HomePageState.loading(state.markers, state.drivers, supp));
    await AppMarkers.createMarkers();

    if (location == null) {
      final isPermissionGranted = await service.isPermissionGranted();
      final isServiceEnabled = await service.isLocationEnabled();
      supp = supp.copyWith(
        isGrantedPermission: isPermissionGranted,
        isServiceEnabled: isServiceEnabled,
      );
      if (isPermissionGranted) {
        final locationData = await service.getCurrentLocation();
        final location =
            LatLng(locationData.latitude!, locationData.longitude!);

        final address = await placesService.getAddress(location);
        supp = supp.copyWith(location: location, address: address ?? 'unknown');
      }
    } else {
      supp = supp.copyWith(
        isGrantedPermission: true,
        isServiceEnabled: true,
        location: location.point,
        address: location.address,
      );
    }

    final markers = await _generateMarkers(supp.location, 300);
    final drivers = <Driver>[];
    for (Marker marker in markers) {
      final index = markers.indexOf(marker);
      var driver = kDriversList[index];
      final point = supp.location;
      final currentPoint = markers[index].position;
      final distance = service.calcDistance(point, currentPoint);
      driver = driver.copyWith(distance: distance, position: currentPoint);
      drivers.add(driver);
    }

    drivers.sort((a, b) => a.distance.compareTo(b.distance));

    markers.add(Marker(
      markerId: userMarkerid,
      position: supp.location,
      icon: BitmapDescriptor.defaultMarker,
    ));
    _markers = markers;

    emit(HomePageState.content(markers, drivers, supp));
  }

  void askForPermission() async {
    var supp = state.supplements;
    emit(HomePageState.loading(state.markers, state.drivers, supp));
    await service.requestPermission();
    init();
  }

  void updateDriver(String driverId) {
    final driver = state.drivers.where((e) => e.id == driverId).toList().first;
    var supp = state.supplements;
    emit(HomePageState.loading(state.markers, state.drivers, supp));
    final marker = Marker(
      markerId: const MarkerId('temp'),
      position: driver.position,
      icon: AppMarkers.getDriverIcon,
    );

    _markers.removeWhere((e) => e.markerId.value == 'temp');
    state.markers.removeWhere((e) => e.markerId.value == 'temp');

    _markers.add(marker);
    final supplements = state.supplements.copyWith(driver: driver);
    emit(HomePageState.content(_markers, state.drivers, supplements));
  }

  void viewOnMap(String driverId) async {
    var supp = state.supplements;
    emit(HomePageState.loading(state.markers, state.drivers, supp));

    final driver = state.drivers.where((e) => e.id == driverId).toList().first;
    final marker = Marker(
      markerId: const MarkerId('temp'),
      position: driver.position,
      icon: AppMarkers.getDriverIcon,
    );

    _markers.removeWhere((e) => e.markerId.value == 'temp');
    state.markers.removeWhere((e) => e.markerId.value == 'temp');

    _markers.add(marker);

    supp = supp.copyWith(
      isViewingDriverOnMap: true,
      driver: driver,
    );
    emit(HomePageState.content(_markers, state.drivers, supp));
  }

  void refreshMap(Completer<GoogleMapController> mapController) async {
    log('resuming from the homepage');
    final supp = state.supplements;
    emit(HomePageState.loading(state.markers, state.drivers, supp));
    final controller = await mapController.future;
    controller.setMapStyle('[]');
    emit(HomePageState.content(state.markers, state.drivers, supp));
  }

  Future<List<Marker>> _generateMarkers(LatLng location, double radius) async {
    final markers = <Marker>[];
    final icon = await AppMarkers.getBitmapIcon('assets/images/bike.bmp');

    final randomLocations = await service.generateRandomLocationData(
        radius, location.latitude, location.longitude);

    var index = 0;

    for (LatLng location in randomLocations) {
      final driver = kDriversList[index];

      final marker = Marker(
        markerId: MarkerId(driver.id),
        position: LatLng(location.latitude, location.longitude),
        icon: icon,
        onTap: () => updateDriver(driver.id),
      );
      markers.add(marker);
      index += 1;
    }

    return markers;
  }

  _checkTrip() {
    tripsService.getTripStream.listen((trips) {
      var supp = state.supplements;
      emit(HomePageState.loading(state.markers, state.drivers, supp));
      final trip = trips.where((e) => e.isReal == true).toList().firstOrNull;
      supp = supp.copyWith(trip: trip ?? supp.trip);
      emit(HomePageState.content(state.markers, state.drivers, supp));
    });
  }
}
