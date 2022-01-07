// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'map_editor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MapEditorTearOff {
  const _$MapEditorTearOff();

  _MapEditor call(
      {required Marker marker,
      required bool isDragging,
      required String address,
      required LatLng location}) {
    return _MapEditor(
      marker: marker,
      isDragging: isDragging,
      address: address,
      location: location,
    );
  }
}

/// @nodoc
const $MapEditor = _$MapEditorTearOff();

/// @nodoc
mixin _$MapEditor {
  Marker get marker => throw _privateConstructorUsedError;
  bool get isDragging => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  LatLng get location => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapEditorCopyWith<MapEditor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapEditorCopyWith<$Res> {
  factory $MapEditorCopyWith(MapEditor value, $Res Function(MapEditor) then) =
      _$MapEditorCopyWithImpl<$Res>;
  $Res call({Marker marker, bool isDragging, String address, LatLng location});
}

/// @nodoc
class _$MapEditorCopyWithImpl<$Res> implements $MapEditorCopyWith<$Res> {
  _$MapEditorCopyWithImpl(this._value, this._then);

  final MapEditor _value;
  // ignore: unused_field
  final $Res Function(MapEditor) _then;

  @override
  $Res call({
    Object? marker = freezed,
    Object? isDragging = freezed,
    Object? address = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      marker: marker == freezed
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as Marker,
      isDragging: isDragging == freezed
          ? _value.isDragging
          : isDragging // ignore: cast_nullable_to_non_nullable
              as bool,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc
abstract class _$MapEditorCopyWith<$Res> implements $MapEditorCopyWith<$Res> {
  factory _$MapEditorCopyWith(
          _MapEditor value, $Res Function(_MapEditor) then) =
      __$MapEditorCopyWithImpl<$Res>;
  @override
  $Res call({Marker marker, bool isDragging, String address, LatLng location});
}

/// @nodoc
class __$MapEditorCopyWithImpl<$Res> extends _$MapEditorCopyWithImpl<$Res>
    implements _$MapEditorCopyWith<$Res> {
  __$MapEditorCopyWithImpl(_MapEditor _value, $Res Function(_MapEditor) _then)
      : super(_value, (v) => _then(v as _MapEditor));

  @override
  _MapEditor get _value => super._value as _MapEditor;

  @override
  $Res call({
    Object? marker = freezed,
    Object? isDragging = freezed,
    Object? address = freezed,
    Object? location = freezed,
  }) {
    return _then(_MapEditor(
      marker: marker == freezed
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as Marker,
      isDragging: isDragging == freezed
          ? _value.isDragging
          : isDragging // ignore: cast_nullable_to_non_nullable
              as bool,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$_MapEditor implements _MapEditor {
  const _$_MapEditor(
      {required this.marker,
      required this.isDragging,
      required this.address,
      required this.location});

  @override
  final Marker marker;
  @override
  final bool isDragging;
  @override
  final String address;
  @override
  final LatLng location;

  @override
  String toString() {
    return 'MapEditor(marker: $marker, isDragging: $isDragging, address: $address, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapEditor &&
            const DeepCollectionEquality().equals(other.marker, marker) &&
            const DeepCollectionEquality()
                .equals(other.isDragging, isDragging) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(marker),
      const DeepCollectionEquality().hash(isDragging),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$MapEditorCopyWith<_MapEditor> get copyWith =>
      __$MapEditorCopyWithImpl<_MapEditor>(this, _$identity);
}

abstract class _MapEditor implements MapEditor {
  const factory _MapEditor(
      {required Marker marker,
      required bool isDragging,
      required String address,
      required LatLng location}) = _$_MapEditor;

  @override
  Marker get marker;
  @override
  bool get isDragging;
  @override
  String get address;
  @override
  LatLng get location;
  @override
  @JsonKey(ignore: true)
  _$MapEditorCopyWith<_MapEditor> get copyWith =>
      throw _privateConstructorUsedError;
}
