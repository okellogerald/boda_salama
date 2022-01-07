import 'dart:async';
import '../source.dart';

class CustomLocationPageBloc extends Cubit<CustomLocationPageState> {
  CustomLocationPageBloc(this.service, this.permissionService)
      : super(CustomLocationPageState.initial());

  final PlacesService service;
  final LocationService permissionService;

  static const markerId = MarkerId('custom-marker');
  static const loadingMarkerId = MarkerId('custom-loading-marker');

  void init(Completer<GoogleMapController> mapController,
      {Location? currentLocation}) async {
    emit(CustomLocationPageState.loading(state.editor));

    var location = const LatLng(0, 0);

    if (currentLocation == null) {
      final locationData = await permissionService.getCurrentLocation();
      location = LatLng(locationData.latitude!, locationData.longitude!);
    } else {
      location = currentLocation.point;
    }

    final address = await service.getAddress(location);
    final marker = Marker(
      markerId: markerId,
      position: location,
      icon: AppMarkers.getFixedIcon,
    );
    final editor = state.editor.copyWith(
      location: location,
      marker: marker,
      address: currentLocation?.address ?? address ?? 'unknown',
    );

    final controller = await mapController.future;
    controller.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: location, zoom: 16.25)));

    emit(CustomLocationPageState.content(editor));
  }

  void onDragStart() async {
    var editor = state.editor;
    emit(CustomLocationPageState.loading(editor));

    final marker = Marker(
      markerId: loadingMarkerId,
      position: editor.location,
      icon: AppMarkers.getLoadingIcon,
    );
    editor = editor.copyWith(isDragging: true, marker: marker);
    emit(CustomLocationPageState.content(editor));
  }

  void onDrag(LatLng location) async {
    var editor = state.editor;
    emit(CustomLocationPageState.loading(editor));

    final marker = Marker(
      markerId: loadingMarkerId,
      position: location,
      icon: AppMarkers.getLoadingIcon,
    );
    editor = editor.copyWith(
      location: location,
      isDragging: true,
      marker: marker,
    );
    emit(CustomLocationPageState.content(editor));
  }

  void onDragEnd() async {
    var editor = state.editor;
    emit(CustomLocationPageState.loading(editor));
    final address = await service.getAddress(editor.location);

    final marker = Marker(
      markerId: markerId,
      position: editor.location,
      icon: AppMarkers.getFixedIcon,
    );
    editor = editor.copyWith(
      isDragging: false,
      marker: marker,
      address: address ?? 'unknown',
    );
    emit(CustomLocationPageState.content(editor));
  }

  void moveToOrigin(Completer<GoogleMapController> mapController) async {
    var editor = state.editor;
    emit(CustomLocationPageState.loading(editor));

    final data = await permissionService.getCurrentLocation();
    final userLocation = LatLng(data.latitude!, data.longitude!);
    final address = await service.getAddress(userLocation);

    final controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: userLocation, zoom: 16.25)));

    final marker = Marker(
      markerId: markerId,
      position: userLocation,
      icon: AppMarkers.getFixedIcon,
    );
    editor = editor.copyWith(
      isDragging: false,
      marker: marker,
      address: address ?? 'unknown',
      location: userLocation,
    );
    emit(CustomLocationPageState.content(editor));
  }

  void confirm() => emit(CustomLocationPageState.success(state.editor));

  void refreshMap(Completer<GoogleMapController> mapController) async {
    log('resuming from the custom location page');

    emit(CustomLocationPageState.loading(state.editor));
    final controller = await mapController.future;
    controller.setMapStyle('[]');
    emit(CustomLocationPageState.content(state.editor));
  }
}
