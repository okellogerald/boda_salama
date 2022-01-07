// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_location_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CustomLocationPageStateTearOff {
  const _$CustomLocationPageStateTearOff();

  _Loading loading(MapEditor editor) {
    return _Loading(
      editor,
    );
  }

  _Content content(MapEditor editor) {
    return _Content(
      editor,
    );
  }

  _Success success(MapEditor editor) {
    return _Success(
      editor,
    );
  }
}

/// @nodoc
const $CustomLocationPageState = _$CustomLocationPageStateTearOff();

/// @nodoc
mixin _$CustomLocationPageState {
  MapEditor get editor => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapEditor editor) loading,
    required TResult Function(MapEditor editor) content,
    required TResult Function(MapEditor editor) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapEditor editor)? loading,
    TResult Function(MapEditor editor)? content,
    TResult Function(MapEditor editor)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapEditor editor)? loading,
    TResult Function(MapEditor editor)? content,
    TResult Function(MapEditor editor)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomLocationPageStateCopyWith<CustomLocationPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLocationPageStateCopyWith<$Res> {
  factory $CustomLocationPageStateCopyWith(CustomLocationPageState value,
          $Res Function(CustomLocationPageState) then) =
      _$CustomLocationPageStateCopyWithImpl<$Res>;
  $Res call({MapEditor editor});

  $MapEditorCopyWith<$Res> get editor;
}

/// @nodoc
class _$CustomLocationPageStateCopyWithImpl<$Res>
    implements $CustomLocationPageStateCopyWith<$Res> {
  _$CustomLocationPageStateCopyWithImpl(this._value, this._then);

  final CustomLocationPageState _value;
  // ignore: unused_field
  final $Res Function(CustomLocationPageState) _then;

  @override
  $Res call({
    Object? editor = freezed,
  }) {
    return _then(_value.copyWith(
      editor: editor == freezed
          ? _value.editor
          : editor // ignore: cast_nullable_to_non_nullable
              as MapEditor,
    ));
  }

  @override
  $MapEditorCopyWith<$Res> get editor {
    return $MapEditorCopyWith<$Res>(_value.editor, (value) {
      return _then(_value.copyWith(editor: value));
    });
  }
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res>
    implements $CustomLocationPageStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({MapEditor editor});

  @override
  $MapEditorCopyWith<$Res> get editor;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$CustomLocationPageStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? editor = freezed,
  }) {
    return _then(_Loading(
      editor == freezed
          ? _value.editor
          : editor // ignore: cast_nullable_to_non_nullable
              as MapEditor,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading(this.editor);

  @override
  final MapEditor editor;

  @override
  String toString() {
    return 'CustomLocationPageState.loading(editor: $editor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality().equals(other.editor, editor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(editor));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapEditor editor) loading,
    required TResult Function(MapEditor editor) content,
    required TResult Function(MapEditor editor) success,
  }) {
    return loading(editor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapEditor editor)? loading,
    TResult Function(MapEditor editor)? content,
    TResult Function(MapEditor editor)? success,
  }) {
    return loading?.call(editor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapEditor editor)? loading,
    TResult Function(MapEditor editor)? content,
    TResult Function(MapEditor editor)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(editor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CustomLocationPageState {
  const factory _Loading(MapEditor editor) = _$_Loading;

  @override
  MapEditor get editor;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ContentCopyWith<$Res>
    implements $CustomLocationPageStateCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) then) =
      __$ContentCopyWithImpl<$Res>;
  @override
  $Res call({MapEditor editor});

  @override
  $MapEditorCopyWith<$Res> get editor;
}

/// @nodoc
class __$ContentCopyWithImpl<$Res>
    extends _$CustomLocationPageStateCopyWithImpl<$Res>
    implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(_Content _value, $Res Function(_Content) _then)
      : super(_value, (v) => _then(v as _Content));

  @override
  _Content get _value => super._value as _Content;

  @override
  $Res call({
    Object? editor = freezed,
  }) {
    return _then(_Content(
      editor == freezed
          ? _value.editor
          : editor // ignore: cast_nullable_to_non_nullable
              as MapEditor,
    ));
  }
}

/// @nodoc

class _$_Content implements _Content {
  const _$_Content(this.editor);

  @override
  final MapEditor editor;

  @override
  String toString() {
    return 'CustomLocationPageState.content(editor: $editor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Content &&
            const DeepCollectionEquality().equals(other.editor, editor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(editor));

  @JsonKey(ignore: true)
  @override
  _$ContentCopyWith<_Content> get copyWith =>
      __$ContentCopyWithImpl<_Content>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapEditor editor) loading,
    required TResult Function(MapEditor editor) content,
    required TResult Function(MapEditor editor) success,
  }) {
    return content(editor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapEditor editor)? loading,
    TResult Function(MapEditor editor)? content,
    TResult Function(MapEditor editor)? success,
  }) {
    return content?.call(editor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapEditor editor)? loading,
    TResult Function(MapEditor editor)? content,
    TResult Function(MapEditor editor)? success,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(editor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class _Content implements CustomLocationPageState {
  const factory _Content(MapEditor editor) = _$_Content;

  @override
  MapEditor get editor;
  @override
  @JsonKey(ignore: true)
  _$ContentCopyWith<_Content> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res>
    implements $CustomLocationPageStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  @override
  $Res call({MapEditor editor});

  @override
  $MapEditorCopyWith<$Res> get editor;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    extends _$CustomLocationPageStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? editor = freezed,
  }) {
    return _then(_Success(
      editor == freezed
          ? _value.editor
          : editor // ignore: cast_nullable_to_non_nullable
              as MapEditor,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(this.editor);

  @override
  final MapEditor editor;

  @override
  String toString() {
    return 'CustomLocationPageState.success(editor: $editor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            const DeepCollectionEquality().equals(other.editor, editor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(editor));

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MapEditor editor) loading,
    required TResult Function(MapEditor editor) content,
    required TResult Function(MapEditor editor) success,
  }) {
    return success(editor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MapEditor editor)? loading,
    TResult Function(MapEditor editor)? content,
    TResult Function(MapEditor editor)? success,
  }) {
    return success?.call(editor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MapEditor editor)? loading,
    TResult Function(MapEditor editor)? content,
    TResult Function(MapEditor editor)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(editor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Content value) content,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Content value)? content,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CustomLocationPageState {
  const factory _Success(MapEditor editor) = _$_Success;

  @override
  MapEditor get editor;
  @override
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}
