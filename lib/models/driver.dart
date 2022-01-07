import 'package:boda_salama/source.dart';

part 'driver.freezed.dart';

@freezed
class Driver with _$Driver {
  const Driver._();

  const factory Driver({
    required String id,
    required String image,
    required String name,
    required int age,
    required double rating,
    required LatLng position,
    required double distance,
  }) = _Driver;

  int get getTimeAway {
    var timeAway = ((distance / 500) * 10).toInt();
    if (timeAway == 0) timeAway = 1;
    return timeAway;
  }

  factory Driver.empty() => const Driver(
      id: '',
      image: '',
      name: '',
      age: 0,
      rating: 0.0,
      position: LatLng(0, 0),
      distance: 0.0);
}
