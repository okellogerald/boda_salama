// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'supplements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SupplementsTearOff {
  const _$SupplementsTearOff();

  _Supplements call(
      {bool isServiceEnabled = false,
      bool isGrantedPermission = false,
      bool isViewingDriverOnMap = false,
      LatLng location = const LatLng(0, 0),
      required Trip trip,
      String address = '',
      Driver? driver}) {
    return _Supplements(
      isServiceEnabled: isServiceEnabled,
      isGrantedPermission: isGrantedPermission,
      isViewingDriverOnMap: isViewingDriverOnMap,
      location: location,
      trip: trip,
      address: address,
      driver: driver,
    );
  }
}

/// @nodoc
const $Supplements = _$SupplementsTearOff();

/// @nodoc
mixin _$Supplements {
  bool get isServiceEnabled => throw _privateConstructorUsedError;
  bool get isGrantedPermission => throw _privateConstructorUsedError;
  bool get isViewingDriverOnMap => throw _privateConstructorUsedError;
  LatLng get location => throw _privateConstructorUsedError;
  Trip get trip => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  Driver? get driver => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SupplementsCopyWith<Supplements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplementsCopyWith<$Res> {
  factory $SupplementsCopyWith(
          Supplements value, $Res Function(Supplements) then) =
      _$SupplementsCopyWithImpl<$Res>;
  $Res call(
      {bool isServiceEnabled,
      bool isGrantedPermission,
      bool isViewingDriverOnMap,
      LatLng location,
      Trip trip,
      String address,
      Driver? driver});

  $DriverCopyWith<$Res>? get driver;
}

/// @nodoc
class _$SupplementsCopyWithImpl<$Res> implements $SupplementsCopyWith<$Res> {
  _$SupplementsCopyWithImpl(this._value, this._then);

  final Supplements _value;
  // ignore: unused_field
  final $Res Function(Supplements) _then;

  @override
  $Res call({
    Object? isServiceEnabled = freezed,
    Object? isGrantedPermission = freezed,
    Object? isViewingDriverOnMap = freezed,
    Object? location = freezed,
    Object? trip = freezed,
    Object? address = freezed,
    Object? driver = freezed,
  }) {
    return _then(_value.copyWith(
      isServiceEnabled: isServiceEnabled == freezed
          ? _value.isServiceEnabled
          : isServiceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isGrantedPermission: isGrantedPermission == freezed
          ? _value.isGrantedPermission
          : isGrantedPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      isViewingDriverOnMap: isViewingDriverOnMap == freezed
          ? _value.isViewingDriverOnMap
          : isViewingDriverOnMap // ignore: cast_nullable_to_non_nullable
              as bool,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      trip: trip == freezed
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as Trip,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      driver: driver == freezed
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
    ));
  }

  @override
  $DriverCopyWith<$Res>? get driver {
    if (_value.driver == null) {
      return null;
    }

    return $DriverCopyWith<$Res>(_value.driver!, (value) {
      return _then(_value.copyWith(driver: value));
    });
  }
}

/// @nodoc
abstract class _$SupplementsCopyWith<$Res>
    implements $SupplementsCopyWith<$Res> {
  factory _$SupplementsCopyWith(
          _Supplements value, $Res Function(_Supplements) then) =
      __$SupplementsCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isServiceEnabled,
      bool isGrantedPermission,
      bool isViewingDriverOnMap,
      LatLng location,
      Trip trip,
      String address,
      Driver? driver});

  @override
  $DriverCopyWith<$Res>? get driver;
}

/// @nodoc
class __$SupplementsCopyWithImpl<$Res> extends _$SupplementsCopyWithImpl<$Res>
    implements _$SupplementsCopyWith<$Res> {
  __$SupplementsCopyWithImpl(
      _Supplements _value, $Res Function(_Supplements) _then)
      : super(_value, (v) => _then(v as _Supplements));

  @override
  _Supplements get _value => super._value as _Supplements;

  @override
  $Res call({
    Object? isServiceEnabled = freezed,
    Object? isGrantedPermission = freezed,
    Object? isViewingDriverOnMap = freezed,
    Object? location = freezed,
    Object? trip = freezed,
    Object? address = freezed,
    Object? driver = freezed,
  }) {
    return _then(_Supplements(
      isServiceEnabled: isServiceEnabled == freezed
          ? _value.isServiceEnabled
          : isServiceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isGrantedPermission: isGrantedPermission == freezed
          ? _value.isGrantedPermission
          : isGrantedPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      isViewingDriverOnMap: isViewingDriverOnMap == freezed
          ? _value.isViewingDriverOnMap
          : isViewingDriverOnMap // ignore: cast_nullable_to_non_nullable
              as bool,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      trip: trip == freezed
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as Trip,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      driver: driver == freezed
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
    ));
  }
}

/// @nodoc

class _$_Supplements implements _Supplements {
  const _$_Supplements(
      {this.isServiceEnabled = false,
      this.isGrantedPermission = false,
      this.isViewingDriverOnMap = false,
      this.location = const LatLng(0, 0),
      required this.trip,
      this.address = '',
      this.driver});

  @JsonKey()
  @override
  final bool isServiceEnabled;
  @JsonKey()
  @override
  final bool isGrantedPermission;
  @JsonKey()
  @override
  final bool isViewingDriverOnMap;
  @JsonKey()
  @override
  final LatLng location;
  @override
  final Trip trip;
  @JsonKey()
  @override
  final String address;
  @override
  final Driver? driver;

  @override
  String toString() {
    return 'Supplements(isServiceEnabled: $isServiceEnabled, isGrantedPermission: $isGrantedPermission, isViewingDriverOnMap: $isViewingDriverOnMap, location: $location, trip: $trip, address: $address, driver: $driver)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Supplements &&
            const DeepCollectionEquality()
                .equals(other.isServiceEnabled, isServiceEnabled) &&
            const DeepCollectionEquality()
                .equals(other.isGrantedPermission, isGrantedPermission) &&
            const DeepCollectionEquality()
                .equals(other.isViewingDriverOnMap, isViewingDriverOnMap) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.trip, trip) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.driver, driver));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isServiceEnabled),
      const DeepCollectionEquality().hash(isGrantedPermission),
      const DeepCollectionEquality().hash(isViewingDriverOnMap),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(trip),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(driver));

  @JsonKey(ignore: true)
  @override
  _$SupplementsCopyWith<_Supplements> get copyWith =>
      __$SupplementsCopyWithImpl<_Supplements>(this, _$identity);
}

abstract class _Supplements implements Supplements {
  const factory _Supplements(
      {bool isServiceEnabled,
      bool isGrantedPermission,
      bool isViewingDriverOnMap,
      LatLng location,
      required Trip trip,
      String address,
      Driver? driver}) = _$_Supplements;

  @override
  bool get isServiceEnabled;
  @override
  bool get isGrantedPermission;
  @override
  bool get isViewingDriverOnMap;
  @override
  LatLng get location;
  @override
  Trip get trip;
  @override
  String get address;
  @override
  Driver? get driver;
  @override
  @JsonKey(ignore: true)
  _$SupplementsCopyWith<_Supplements> get copyWith =>
      throw _privateConstructorUsedError;
}
