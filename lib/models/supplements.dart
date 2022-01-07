import '../source.dart';

part 'supplements.freezed.dart';

@freezed
class Supplements with _$Supplements {
  const factory Supplements({
    @Default(false) bool isServiceEnabled,
    @Default(false) bool isGrantedPermission,
    @Default(false) bool isViewingDriverOnMap,
    @Default(LatLng(0, 0)) LatLng location,
    required Trip trip,
    @Default('') String address,
    Driver? driver,
  }) = _Supplements;
}
