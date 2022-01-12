import 'dart:async';

import '../source.dart';

class ChatPageBloc extends Cubit<ChatPageState> {
  ChatPageBloc(this.tripsService) : super(const ChatPageState.content());

  final TripsService tripsService;
  var _isCancelled = false;

  void init(Driver driver, Location userLocation) async {
    emit(ChatPageState.loading('Establishing connection with ${driver.name}'));
    await Future.delayed(const Duration(seconds: 3));

    if (_isCancelled) return;
    await tripsService.addTrip(
        driver: driver, location: userLocation, isReal: true);
    emit(const ChatPageState.content());
  }

  void cancelTrip() {
    _isCancelled = true;
    emit(const ChatPageState.cancelled());
  }

  void refreshMap(Completer<GoogleMapController> mapController) async {
    log('resuming from the chat page');
    emit(const ChatPageState.loading('Refreshing the map'));
    final controller = await mapController.future;
    controller.setMapStyle(AppMapStyling.getRetroStyle);
    emit(const ChatPageState.content());
  }
}
