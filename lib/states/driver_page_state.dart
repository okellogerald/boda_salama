import '../source.dart';

part 'driver_page_state.freezed.dart';

@freezed
class DriverPageState with _$DriverPageState {
  const factory DriverPageState.loading(DriverPageSupplements supplements) = _Loading;
  const factory DriverPageState.content(DriverPageSupplements supplements) = _Content;

  factory DriverPageState.initial() =>  DriverPageState.content(DriverPageSupplements.empty());
}
