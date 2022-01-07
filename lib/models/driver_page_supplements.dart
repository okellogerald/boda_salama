import '../source.dart';

part 'driver_page_supplements.freezed.dart';

@freezed
class DriverPageSupplements with _$DriverPageSupplements {
  const factory DriverPageSupplements({
    required List<Marker> markers,
    required List<Trip> trips,
    required Driver driver,
    required bool isOffline,
    required int currentIndex,
  }) = _DriverPageSupplements;

  factory DriverPageSupplements.empty() => DriverPageSupplements(
        markers: [],
        trips: [],
        driver: Driver.empty(),
        isOffline: true,
        currentIndex: 0,
      );
}
