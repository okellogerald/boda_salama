// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomePageStateTearOff {
  const _$HomePageStateTearOff();

  _Loading loading(
      List<Marker> markers, List<Driver> drivers, Supplements supplements) {
    return _Loading(
      markers,
      drivers,
      supplements,
    );
  }

  _Content content(
      List<Marker> markers, List<Driver> drivers, Supplements supplements) {
    return _Content(
      markers,
      drivers,
      supplements,
    );
  }
}

/// @nodoc
const $HomePageState = _$HomePageStateTearOff();

/// @nodoc
mixin _$HomePageState {
  List<Marker> get markers => throw _privateConstructorUsedError;
  List<Driver> get drivers => throw _privateConstructorUsedError;
  Supplements get supplements => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Marker> markers, List<Driver> drivers, Supplements supplements)
        loading,
    required TResult Function(
            List<Marker> markers, List<Driver> drivers, Supplements supplements)
        content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Marker> markers, List<Driver> drivers,
            Supplements supplements)?
        loading,
    TResult Function(List<Marker> markers, List<Driver> drivers,
            Supplements supplements)?
        content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Marker> markers, List<Driver> drivers,
            Supplements supplements)?
        loading,
    TResult Function(List<Marker> markers, List<Driver> drivers,
            Supplements supplements)?
        content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res>;
  $Res call(
      {List<Marker> markers, List<Driver> drivers, Supplements supplements});

  $SupplementsCopyWith<$Res> get supplements;
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  final HomePageState _value;
  // ignore: unused_field
  final $Res Function(HomePageState) _then;

  @override
  $Res call({
    Object? markers = freezed,
    Object? drivers = freezed,
    Object? supplements = freezed,
  }) {
    return _then(_value.copyWith(
      markers: markers == freezed
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      drivers: drivers == freezed
          ? _value.drivers
          : drivers // ignore: cast_nullable_to_non_nullable
              as List<Driver>,
      supplements: supplements == freezed
          ? _value.supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as Supplements,
    ));
  }

  @override
  $SupplementsCopyWith<$Res> get supplements {
    return $SupplementsCopyWith<$Res>(_value.supplements, (value) {
      return _then(_value.copyWith(supplements: value));
    });
  }
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> implements $HomePageStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Marker> markers, List<Driver> drivers, Supplements supplements});

  @override
  $SupplementsCopyWith<$Res> get supplements;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$HomePageStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? markers = freezed,
    Object? drivers = freezed,
    Object? supplements = freezed,
  }) {
    return _then(_Loading(
      markers == freezed
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      drivers == freezed
          ? _value.drivers
          : drivers // ignore: cast_nullable_to_non_nullable
              as List<Driver>,
      supplements == freezed
          ? _value.supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as Supplements,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading(this.markers, this.drivers, this.supplements);

  @override
  final List<Marker> markers;
  @override
  final List<Driver> drivers;
  @override
  final Supplements supplements;

  @override
  String toString() {
    return 'HomePageState.loading(markers: $markers, drivers: $drivers, supplements: $supplements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality().equals(other.markers, markers) &&
            const DeepCollectionEquality().equals(other.drivers, drivers) &&
            const DeepCollectionEquality()
                .equals(other.supplements, supplements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(markers),
      const DeepCollectionEquality().hash(drivers),
      const DeepCollectionEquality().hash(supplements));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Marker> markers, List<Driver> drivers, Supplements supplements)
        loading,
    required TResult Function(
            List<Marker> markers, List<Driver> drivers, Supplements supplements)
        content,
  }) {
    return loading(markers, drivers, supplements);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Marker> markers, List<Driver> drivers,
            Supplements supplements)?
        loading,
    TResult Function(List<Marker> markers, List<Driver> drivers,
            Supplements supplements)?
        content,
  }) {
    return loading?.call(markers, drivers, supplements);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Marker> markers, List<Driver> drivers,
            Supplements supplements)?
        loading,
    TResult Function(List<Marker> markers, List<Driver> drivers,
            Supplements supplements)?
        content,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(markers, drivers, supplements);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomePageState {
  const factory _Loading(
          List<Marker> markers, List<Driver> drivers, Supplements supplements) =
      _$_Loading;

  @override
  List<Marker> get markers;
  @override
  List<Driver> get drivers;
  @override
  Supplements get supplements;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ContentCopyWith<$Res> implements $HomePageStateCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) then) =
      __$ContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Marker> markers, List<Driver> drivers, Supplements supplements});

  @override
  $SupplementsCopyWith<$Res> get supplements;
}

/// @nodoc
class __$ContentCopyWithImpl<$Res> extends _$HomePageStateCopyWithImpl<$Res>
    implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(_Content _value, $Res Function(_Content) _then)
      : super(_value, (v) => _then(v as _Content));

  @override
  _Content get _value => super._value as _Content;

  @override
  $Res call({
    Object? markers = freezed,
    Object? drivers = freezed,
    Object? supplements = freezed,
  }) {
    return _then(_Content(
      markers == freezed
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      drivers == freezed
          ? _value.drivers
          : drivers // ignore: cast_nullable_to_non_nullable
              as List<Driver>,
      supplements == freezed
          ? _value.supplements
          : supplements // ignore: cast_nullable_to_non_nullable
              as Supplements,
    ));
  }
}

/// @nodoc

class _$_Content implements _Content {
  const _$_Content(this.markers, this.drivers, this.supplements);

  @override
  final List<Marker> markers;
  @override
  final List<Driver> drivers;
  @override
  final Supplements supplements;

  @override
  String toString() {
    return 'HomePageState.content(markers: $markers, drivers: $drivers, supplements: $supplements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Content &&
            const DeepCollectionEquality().equals(other.markers, markers) &&
            const DeepCollectionEquality().equals(other.drivers, drivers) &&
            const DeepCollectionEquality()
                .equals(other.supplements, supplements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(markers),
      const DeepCollectionEquality().hash(drivers),
      const DeepCollectionEquality().hash(supplements));

  @JsonKey(ignore: true)
  @override
  _$ContentCopyWith<_Content> get copyWith =>
      __$ContentCopyWithImpl<_Content>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Marker> markers, List<Driver> drivers, Supplements supplements)
        loading,
    required TResult Function(
            List<Marker> markers, List<Driver> drivers, Supplements supplements)
        content,
  }) {
    return content(markers, drivers, supplements);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Marker> markers, List<Driver> drivers,
            Supplements supplements)?
        loading,
    TResult Function(List<Marker> markers, List<Driver> drivers,
            Supplements supplements)?
        content,
  }) {
    return content?.call(markers, drivers, supplements);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Marker> markers, List<Driver> drivers,
            Supplements supplements)?
        loading,
    TResult Function(List<Marker> markers, List<Driver> drivers,
            Supplements supplements)?
        content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(markers, drivers, supplements);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class _Content implements HomePageState {
  const factory _Content(
          List<Marker> markers, List<Driver> drivers, Supplements supplements) =
      _$_Content;

  @override
  List<Marker> get markers;
  @override
  List<Driver> get drivers;
  @override
  Supplements get supplements;
  @override
  @JsonKey(ignore: true)
  _$ContentCopyWith<_Content> get copyWith =>
      throw _privateConstructorUsedError;
}
