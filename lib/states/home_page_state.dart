import 'package:boda_salama/source.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.loading(List<Marker> markers, List<Driver> drivers, Supplements supplements) = _Loading;
  const factory HomePageState.content(List<Marker> markers, List<Driver> drivers, Supplements supplements) = _Content;

  factory HomePageState.initial() =>  HomePageState.content([],[], Supplements(trip: Trip.empty()));
}
