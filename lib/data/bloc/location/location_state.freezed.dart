// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocationStateTearOff {
  const _$LocationStateTearOff();

  LocationInitState init() {
    return const LocationInitState();
  }

  LocationErrorState error(String message) {
    return LocationErrorState(
      message,
    );
  }

  LocationPositionState locationUpdate(Position position) {
    return LocationPositionState(
      position,
    );
  }

  LocationLoadingState loading() {
    return const LocationLoadingState();
  }
}

/// @nodoc
const $LocationState = _$LocationStateTearOff();

/// @nodoc
mixin _$LocationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(Position position) locationUpdate,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position position)? locationUpdate,
    TResult Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position position)? locationUpdate,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInitState value) init,
    required TResult Function(LocationErrorState value) error,
    required TResult Function(LocationPositionState value) locationUpdate,
    required TResult Function(LocationLoadingState value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LocationInitState value)? init,
    TResult Function(LocationErrorState value)? error,
    TResult Function(LocationPositionState value)? locationUpdate,
    TResult Function(LocationLoadingState value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInitState value)? init,
    TResult Function(LocationErrorState value)? error,
    TResult Function(LocationPositionState value)? locationUpdate,
    TResult Function(LocationLoadingState value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  final LocationState _value;
  // ignore: unused_field
  final $Res Function(LocationState) _then;
}

/// @nodoc
abstract class $LocationInitStateCopyWith<$Res> {
  factory $LocationInitStateCopyWith(
          LocationInitState value, $Res Function(LocationInitState) then) =
      _$LocationInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationInitStateCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $LocationInitStateCopyWith<$Res> {
  _$LocationInitStateCopyWithImpl(
      LocationInitState _value, $Res Function(LocationInitState) _then)
      : super(_value, (v) => _then(v as LocationInitState));

  @override
  LocationInitState get _value => super._value as LocationInitState;
}

/// @nodoc

class _$LocationInitState implements LocationInitState {
  const _$LocationInitState();

  @override
  String toString() {
    return 'LocationState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocationInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(Position position) locationUpdate,
    required TResult Function() loading,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position position)? locationUpdate,
    TResult Function()? loading,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position position)? locationUpdate,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInitState value) init,
    required TResult Function(LocationErrorState value) error,
    required TResult Function(LocationPositionState value) locationUpdate,
    required TResult Function(LocationLoadingState value) loading,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LocationInitState value)? init,
    TResult Function(LocationErrorState value)? error,
    TResult Function(LocationPositionState value)? locationUpdate,
    TResult Function(LocationLoadingState value)? loading,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInitState value)? init,
    TResult Function(LocationErrorState value)? error,
    TResult Function(LocationPositionState value)? locationUpdate,
    TResult Function(LocationLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class LocationInitState implements LocationState {
  const factory LocationInitState() = _$LocationInitState;
}

/// @nodoc
abstract class $LocationErrorStateCopyWith<$Res> {
  factory $LocationErrorStateCopyWith(
          LocationErrorState value, $Res Function(LocationErrorState) then) =
      _$LocationErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$LocationErrorStateCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $LocationErrorStateCopyWith<$Res> {
  _$LocationErrorStateCopyWithImpl(
      LocationErrorState _value, $Res Function(LocationErrorState) _then)
      : super(_value, (v) => _then(v as LocationErrorState));

  @override
  LocationErrorState get _value => super._value as LocationErrorState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(LocationErrorState(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocationErrorState implements LocationErrorState {
  const _$LocationErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LocationState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationErrorState &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $LocationErrorStateCopyWith<LocationErrorState> get copyWith =>
      _$LocationErrorStateCopyWithImpl<LocationErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(Position position) locationUpdate,
    required TResult Function() loading,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position position)? locationUpdate,
    TResult Function()? loading,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position position)? locationUpdate,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInitState value) init,
    required TResult Function(LocationErrorState value) error,
    required TResult Function(LocationPositionState value) locationUpdate,
    required TResult Function(LocationLoadingState value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LocationInitState value)? init,
    TResult Function(LocationErrorState value)? error,
    TResult Function(LocationPositionState value)? locationUpdate,
    TResult Function(LocationLoadingState value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInitState value)? init,
    TResult Function(LocationErrorState value)? error,
    TResult Function(LocationPositionState value)? locationUpdate,
    TResult Function(LocationLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LocationErrorState implements LocationState {
  const factory LocationErrorState(String message) = _$LocationErrorState;

  String get message;
  @JsonKey(ignore: true)
  $LocationErrorStateCopyWith<LocationErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationPositionStateCopyWith<$Res> {
  factory $LocationPositionStateCopyWith(LocationPositionState value,
          $Res Function(LocationPositionState) then) =
      _$LocationPositionStateCopyWithImpl<$Res>;
  $Res call({Position position});
}

/// @nodoc
class _$LocationPositionStateCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $LocationPositionStateCopyWith<$Res> {
  _$LocationPositionStateCopyWithImpl(
      LocationPositionState _value, $Res Function(LocationPositionState) _then)
      : super(_value, (v) => _then(v as LocationPositionState));

  @override
  LocationPositionState get _value => super._value as LocationPositionState;

  @override
  $Res call({
    Object? position = freezed,
  }) {
    return _then(LocationPositionState(
      position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
    ));
  }
}

/// @nodoc

class _$LocationPositionState implements LocationPositionState {
  const _$LocationPositionState(this.position);

  @override
  final Position position;

  @override
  String toString() {
    return 'LocationState.locationUpdate(position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationPositionState &&
            const DeepCollectionEquality().equals(other.position, position));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(position));

  @JsonKey(ignore: true)
  @override
  $LocationPositionStateCopyWith<LocationPositionState> get copyWith =>
      _$LocationPositionStateCopyWithImpl<LocationPositionState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(Position position) locationUpdate,
    required TResult Function() loading,
  }) {
    return locationUpdate(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position position)? locationUpdate,
    TResult Function()? loading,
  }) {
    return locationUpdate?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position position)? locationUpdate,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (locationUpdate != null) {
      return locationUpdate(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInitState value) init,
    required TResult Function(LocationErrorState value) error,
    required TResult Function(LocationPositionState value) locationUpdate,
    required TResult Function(LocationLoadingState value) loading,
  }) {
    return locationUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LocationInitState value)? init,
    TResult Function(LocationErrorState value)? error,
    TResult Function(LocationPositionState value)? locationUpdate,
    TResult Function(LocationLoadingState value)? loading,
  }) {
    return locationUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInitState value)? init,
    TResult Function(LocationErrorState value)? error,
    TResult Function(LocationPositionState value)? locationUpdate,
    TResult Function(LocationLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (locationUpdate != null) {
      return locationUpdate(this);
    }
    return orElse();
  }
}

abstract class LocationPositionState implements LocationState {
  const factory LocationPositionState(Position position) =
      _$LocationPositionState;

  Position get position;
  @JsonKey(ignore: true)
  $LocationPositionStateCopyWith<LocationPositionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationLoadingStateCopyWith<$Res> {
  factory $LocationLoadingStateCopyWith(LocationLoadingState value,
          $Res Function(LocationLoadingState) then) =
      _$LocationLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationLoadingStateCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $LocationLoadingStateCopyWith<$Res> {
  _$LocationLoadingStateCopyWithImpl(
      LocationLoadingState _value, $Res Function(LocationLoadingState) _then)
      : super(_value, (v) => _then(v as LocationLoadingState));

  @override
  LocationLoadingState get _value => super._value as LocationLoadingState;
}

/// @nodoc

class _$LocationLoadingState implements LocationLoadingState {
  const _$LocationLoadingState();

  @override
  String toString() {
    return 'LocationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocationLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String message) error,
    required TResult Function(Position position) locationUpdate,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position position)? locationUpdate,
    TResult Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String message)? error,
    TResult Function(Position position)? locationUpdate,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationInitState value) init,
    required TResult Function(LocationErrorState value) error,
    required TResult Function(LocationPositionState value) locationUpdate,
    required TResult Function(LocationLoadingState value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LocationInitState value)? init,
    TResult Function(LocationErrorState value)? error,
    TResult Function(LocationPositionState value)? locationUpdate,
    TResult Function(LocationLoadingState value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationInitState value)? init,
    TResult Function(LocationErrorState value)? error,
    TResult Function(LocationPositionState value)? locationUpdate,
    TResult Function(LocationLoadingState value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LocationLoadingState implements LocationState {
  const factory LocationLoadingState() = _$LocationLoadingState;
}
