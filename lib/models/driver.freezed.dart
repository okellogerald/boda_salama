// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'driver.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DriverTearOff {
  const _$DriverTearOff();

  _Driver call(
      {required String id,
      required String image,
      required String name,
      required int age,
      required double rating,
      required LatLng position,
      required double distance}) {
    return _Driver(
      id: id,
      image: image,
      name: name,
      age: age,
      rating: rating,
      position: position,
      distance: distance,
    );
  }
}

/// @nodoc
const $Driver = _$DriverTearOff();

/// @nodoc
mixin _$Driver {
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  LatLng get position => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DriverCopyWith<Driver> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverCopyWith<$Res> {
  factory $DriverCopyWith(Driver value, $Res Function(Driver) then) =
      _$DriverCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String image,
      String name,
      int age,
      double rating,
      LatLng position,
      double distance});
}

/// @nodoc
class _$DriverCopyWithImpl<$Res> implements $DriverCopyWith<$Res> {
  _$DriverCopyWithImpl(this._value, this._then);

  final Driver _value;
  // ignore: unused_field
  final $Res Function(Driver) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? rating = freezed,
    Object? position = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$DriverCopyWith<$Res> implements $DriverCopyWith<$Res> {
  factory _$DriverCopyWith(_Driver value, $Res Function(_Driver) then) =
      __$DriverCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String image,
      String name,
      int age,
      double rating,
      LatLng position,
      double distance});
}

/// @nodoc
class __$DriverCopyWithImpl<$Res> extends _$DriverCopyWithImpl<$Res>
    implements _$DriverCopyWith<$Res> {
  __$DriverCopyWithImpl(_Driver _value, $Res Function(_Driver) _then)
      : super(_value, (v) => _then(v as _Driver));

  @override
  _Driver get _value => super._value as _Driver;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? rating = freezed,
    Object? position = freezed,
    Object? distance = freezed,
  }) {
    return _then(_Driver(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Driver extends _Driver {
  const _$_Driver(
      {required this.id,
      required this.image,
      required this.name,
      required this.age,
      required this.rating,
      required this.position,
      required this.distance})
      : super._();

  @override
  final String id;
  @override
  final String image;
  @override
  final String name;
  @override
  final int age;
  @override
  final double rating;
  @override
  final LatLng position;
  @override
  final double distance;

  @override
  String toString() {
    return 'Driver(id: $id, image: $image, name: $name, age: $age, rating: $rating, position: $position, distance: $distance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Driver &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.distance, distance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(distance));

  @JsonKey(ignore: true)
  @override
  _$DriverCopyWith<_Driver> get copyWith =>
      __$DriverCopyWithImpl<_Driver>(this, _$identity);
}

abstract class _Driver extends Driver {
  const factory _Driver(
      {required String id,
      required String image,
      required String name,
      required int age,
      required double rating,
      required LatLng position,
      required double distance}) = _$_Driver;
  const _Driver._() : super._();

  @override
  String get id;
  @override
  String get image;
  @override
  String get name;
  @override
  int get age;
  @override
  double get rating;
  @override
  LatLng get position;
  @override
  double get distance;
  @override
  @JsonKey(ignore: true)
  _$DriverCopyWith<_Driver> get copyWith => throw _privateConstructorUsedError;
}
