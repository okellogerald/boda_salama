// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'driver_page_supplements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DriverPageSupplementsTearOff {
  const _$DriverPageSupplementsTearOff();

  _DriverPageSupplements call(
      {required List<Marker> markers,
      required List<Trip> trips,
      required Driver driver,
      required bool isOffline,
      required int currentIndex}) {
    return _DriverPageSupplements(
      markers: markers,
      trips: trips,
      driver: driver,
      isOffline: isOffline,
      currentIndex: currentIndex,
    );
  }
}

/// @nodoc
const $DriverPageSupplements = _$DriverPageSupplementsTearOff();

/// @nodoc
mixin _$DriverPageSupplements {
  List<Marker> get markers => throw _privateConstructorUsedError;
  List<Trip> get trips => throw _privateConstructorUsedError;
  Driver get driver => throw _privateConstructorUsedError;
  bool get isOffline => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DriverPageSupplementsCopyWith<DriverPageSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverPageSupplementsCopyWith<$Res> {
  factory $DriverPageSupplementsCopyWith(DriverPageSupplements value,
          $Res Function(DriverPageSupplements) then) =
      _$DriverPageSupplementsCopyWithImpl<$Res>;
  $Res call(
      {List<Marker> markers,
      List<Trip> trips,
      Driver driver,
      bool isOffline,
      int currentIndex});

  $DriverCopyWith<$Res> get driver;
}

/// @nodoc
class _$DriverPageSupplementsCopyWithImpl<$Res>
    implements $DriverPageSupplementsCopyWith<$Res> {
  _$DriverPageSupplementsCopyWithImpl(this._value, this._then);

  final DriverPageSupplements _value;
  // ignore: unused_field
  final $Res Function(DriverPageSupplements) _then;

  @override
  $Res call({
    Object? markers = freezed,
    Object? trips = freezed,
    Object? driver = freezed,
    Object? isOffline = freezed,
    Object? currentIndex = freezed,
  }) {
    return _then(_value.copyWith(
      markers: markers == freezed
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      trips: trips == freezed
          ? _value.trips
          : trips // ignore: cast_nullable_to_non_nullable
              as List<Trip>,
      driver: driver == freezed
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver,
      isOffline: isOffline == freezed
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $DriverCopyWith<$Res> get driver {
    return $DriverCopyWith<$Res>(_value.driver, (value) {
      return _then(_value.copyWith(driver: value));
    });
  }
}

/// @nodoc
abstract class _$DriverPageSupplementsCopyWith<$Res>
    implements $DriverPageSupplementsCopyWith<$Res> {
  factory _$DriverPageSupplementsCopyWith(_DriverPageSupplements value,
          $Res Function(_DriverPageSupplements) then) =
      __$DriverPageSupplementsCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Marker> markers,
      List<Trip> trips,
      Driver driver,
      bool isOffline,
      int currentIndex});

  @override
  $DriverCopyWith<$Res> get driver;
}

/// @nodoc
class __$DriverPageSupplementsCopyWithImpl<$Res>
    extends _$DriverPageSupplementsCopyWithImpl<$Res>
    implements _$DriverPageSupplementsCopyWith<$Res> {
  __$DriverPageSupplementsCopyWithImpl(_DriverPageSupplements _value,
      $Res Function(_DriverPageSupplements) _then)
      : super(_value, (v) => _then(v as _DriverPageSupplements));

  @override
  _DriverPageSupplements get _value => super._value as _DriverPageSupplements;

  @override
  $Res call({
    Object? markers = freezed,
    Object? trips = freezed,
    Object? driver = freezed,
    Object? isOffline = freezed,
    Object? currentIndex = freezed,
  }) {
    return _then(_DriverPageSupplements(
      markers: markers == freezed
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      trips: trips == freezed
          ? _value.trips
          : trips // ignore: cast_nullable_to_non_nullable
              as List<Trip>,
      driver: driver == freezed
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver,
      isOffline: isOffline == freezed
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DriverPageSupplements implements _DriverPageSupplements {
  const _$_DriverPageSupplements(
      {required this.markers,
      required this.trips,
      required this.driver,
      required this.isOffline,
      required this.currentIndex});

  @override
  final List<Marker> markers;
  @override
  final List<Trip> trips;
  @override
  final Driver driver;
  @override
  final bool isOffline;
  @override
  final int currentIndex;

  @override
  String toString() {
    return 'DriverPageSupplements(markers: $markers, trips: $trips, driver: $driver, isOffline: $isOffline, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DriverPageSupplements &&
            const DeepCollectionEquality().equals(other.markers, markers) &&
            const DeepCollectionEquality().equals(other.trips, trips) &&
            const DeepCollectionEquality().equals(other.driver, driver) &&
            const DeepCollectionEquality().equals(other.isOffline, isOffline) &&
            const DeepCollectionEquality()
                .equals(other.currentIndex, currentIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(markers),
      const DeepCollectionEquality().hash(trips),
      const DeepCollectionEquality().hash(driver),
      const DeepCollectionEquality().hash(isOffline),
      const DeepCollectionEquality().hash(currentIndex));

  @JsonKey(ignore: true)
  @override
  _$DriverPageSupplementsCopyWith<_DriverPageSupplements> get copyWith =>
      __$DriverPageSupplementsCopyWithImpl<_DriverPageSupplements>(
          this, _$identity);
}

abstract class _DriverPageSupplements implements DriverPageSupplements {
  const factory _DriverPageSupplements(
      {required List<Marker> markers,
      required List<Trip> trips,
      required Driver driver,
      required bool isOffline,
      required int currentIndex}) = _$_DriverPageSupplements;

  @override
  List<Marker> get markers;
  @override
  List<Trip> get trips;
  @override
  Driver get driver;
  @override
  bool get isOffline;
  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$DriverPageSupplementsCopyWith<_DriverPageSupplements> get copyWith =>
      throw _privateConstructorUsedError;
}
