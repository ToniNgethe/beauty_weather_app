// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WeatherStateTearOff {
  const _$WeatherStateTearOff();

  WeatherInitState init() {
    return const WeatherInitState();
  }

  WeatherLoadingState loading() {
    return const WeatherLoadingState();
  }

  WeatherErrorState error(String message) {
    return WeatherErrorState(
      message,
    );
  }

  WeatherTodayState todayWeather(WeatherModel currentWeatherModel) {
    return WeatherTodayState(
      currentWeatherModel,
    );
  }

  WeatherForecastState forecastWeather(
      List<WeatherModel>? forecastWeatherModel) {
    return WeatherForecastState(
      forecastWeatherModel,
    );
  }

  WeatherNotifyState notifyUser(String message) {
    return WeatherNotifyState(
      message,
    );
  }
}

/// @nodoc
const $WeatherState = _$WeatherStateTearOff();

/// @nodoc
mixin _$WeatherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(WeatherModel currentWeatherModel) todayWeather,
    required TResult Function(List<WeatherModel>? forecastWeatherModel)
        forecastWeather,
    required TResult Function(String message) notifyUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherInitState value) init,
    required TResult Function(WeatherLoadingState value) loading,
    required TResult Function(WeatherErrorState value) error,
    required TResult Function(WeatherTodayState value) todayWeather,
    required TResult Function(WeatherForecastState value) forecastWeather,
    required TResult Function(WeatherNotifyState value) notifyUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res> implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  final WeatherState _value;
  // ignore: unused_field
  final $Res Function(WeatherState) _then;
}

/// @nodoc
abstract class $WeatherInitStateCopyWith<$Res> {
  factory $WeatherInitStateCopyWith(
          WeatherInitState value, $Res Function(WeatherInitState) then) =
      _$WeatherInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WeatherInitStateCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements $WeatherInitStateCopyWith<$Res> {
  _$WeatherInitStateCopyWithImpl(
      WeatherInitState _value, $Res Function(WeatherInitState) _then)
      : super(_value, (v) => _then(v as WeatherInitState));

  @override
  WeatherInitState get _value => super._value as WeatherInitState;
}

/// @nodoc

class _$WeatherInitState implements WeatherInitState {
  const _$WeatherInitState();

  @override
  String toString() {
    return 'WeatherState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WeatherInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(WeatherModel currentWeatherModel) todayWeather,
    required TResult Function(List<WeatherModel>? forecastWeatherModel)
        forecastWeather,
    required TResult Function(String message) notifyUser,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
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
    required TResult Function(WeatherInitState value) init,
    required TResult Function(WeatherLoadingState value) loading,
    required TResult Function(WeatherErrorState value) error,
    required TResult Function(WeatherTodayState value) todayWeather,
    required TResult Function(WeatherForecastState value) forecastWeather,
    required TResult Function(WeatherNotifyState value) notifyUser,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class WeatherInitState implements WeatherState {
  const factory WeatherInitState() = _$WeatherInitState;
}

/// @nodoc
abstract class $WeatherLoadingStateCopyWith<$Res> {
  factory $WeatherLoadingStateCopyWith(
          WeatherLoadingState value, $Res Function(WeatherLoadingState) then) =
      _$WeatherLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WeatherLoadingStateCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements $WeatherLoadingStateCopyWith<$Res> {
  _$WeatherLoadingStateCopyWithImpl(
      WeatherLoadingState _value, $Res Function(WeatherLoadingState) _then)
      : super(_value, (v) => _then(v as WeatherLoadingState));

  @override
  WeatherLoadingState get _value => super._value as WeatherLoadingState;
}

/// @nodoc

class _$WeatherLoadingState implements WeatherLoadingState {
  const _$WeatherLoadingState();

  @override
  String toString() {
    return 'WeatherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WeatherLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(WeatherModel currentWeatherModel) todayWeather,
    required TResult Function(List<WeatherModel>? forecastWeatherModel)
        forecastWeather,
    required TResult Function(String message) notifyUser,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
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
    required TResult Function(WeatherInitState value) init,
    required TResult Function(WeatherLoadingState value) loading,
    required TResult Function(WeatherErrorState value) error,
    required TResult Function(WeatherTodayState value) todayWeather,
    required TResult Function(WeatherForecastState value) forecastWeather,
    required TResult Function(WeatherNotifyState value) notifyUser,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class WeatherLoadingState implements WeatherState {
  const factory WeatherLoadingState() = _$WeatherLoadingState;
}

/// @nodoc
abstract class $WeatherErrorStateCopyWith<$Res> {
  factory $WeatherErrorStateCopyWith(
          WeatherErrorState value, $Res Function(WeatherErrorState) then) =
      _$WeatherErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$WeatherErrorStateCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements $WeatherErrorStateCopyWith<$Res> {
  _$WeatherErrorStateCopyWithImpl(
      WeatherErrorState _value, $Res Function(WeatherErrorState) _then)
      : super(_value, (v) => _then(v as WeatherErrorState));

  @override
  WeatherErrorState get _value => super._value as WeatherErrorState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(WeatherErrorState(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WeatherErrorState implements WeatherErrorState {
  const _$WeatherErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'WeatherState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherErrorState &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $WeatherErrorStateCopyWith<WeatherErrorState> get copyWith =>
      _$WeatherErrorStateCopyWithImpl<WeatherErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(WeatherModel currentWeatherModel) todayWeather,
    required TResult Function(List<WeatherModel>? forecastWeatherModel)
        forecastWeather,
    required TResult Function(String message) notifyUser,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
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
    required TResult Function(WeatherInitState value) init,
    required TResult Function(WeatherLoadingState value) loading,
    required TResult Function(WeatherErrorState value) error,
    required TResult Function(WeatherTodayState value) todayWeather,
    required TResult Function(WeatherForecastState value) forecastWeather,
    required TResult Function(WeatherNotifyState value) notifyUser,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class WeatherErrorState implements WeatherState {
  const factory WeatherErrorState(String message) = _$WeatherErrorState;

  String get message;
  @JsonKey(ignore: true)
  $WeatherErrorStateCopyWith<WeatherErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherTodayStateCopyWith<$Res> {
  factory $WeatherTodayStateCopyWith(
          WeatherTodayState value, $Res Function(WeatherTodayState) then) =
      _$WeatherTodayStateCopyWithImpl<$Res>;
  $Res call({WeatherModel currentWeatherModel});
}

/// @nodoc
class _$WeatherTodayStateCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements $WeatherTodayStateCopyWith<$Res> {
  _$WeatherTodayStateCopyWithImpl(
      WeatherTodayState _value, $Res Function(WeatherTodayState) _then)
      : super(_value, (v) => _then(v as WeatherTodayState));

  @override
  WeatherTodayState get _value => super._value as WeatherTodayState;

  @override
  $Res call({
    Object? currentWeatherModel = freezed,
  }) {
    return _then(WeatherTodayState(
      currentWeatherModel == freezed
          ? _value.currentWeatherModel
          : currentWeatherModel // ignore: cast_nullable_to_non_nullable
              as WeatherModel,
    ));
  }
}

/// @nodoc

class _$WeatherTodayState implements WeatherTodayState {
  const _$WeatherTodayState(this.currentWeatherModel);

  @override
  final WeatherModel currentWeatherModel;

  @override
  String toString() {
    return 'WeatherState.todayWeather(currentWeatherModel: $currentWeatherModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherTodayState &&
            const DeepCollectionEquality()
                .equals(other.currentWeatherModel, currentWeatherModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentWeatherModel));

  @JsonKey(ignore: true)
  @override
  $WeatherTodayStateCopyWith<WeatherTodayState> get copyWith =>
      _$WeatherTodayStateCopyWithImpl<WeatherTodayState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(WeatherModel currentWeatherModel) todayWeather,
    required TResult Function(List<WeatherModel>? forecastWeatherModel)
        forecastWeather,
    required TResult Function(String message) notifyUser,
  }) {
    return todayWeather(currentWeatherModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
  }) {
    return todayWeather?.call(currentWeatherModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
    required TResult orElse(),
  }) {
    if (todayWeather != null) {
      return todayWeather(currentWeatherModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherInitState value) init,
    required TResult Function(WeatherLoadingState value) loading,
    required TResult Function(WeatherErrorState value) error,
    required TResult Function(WeatherTodayState value) todayWeather,
    required TResult Function(WeatherForecastState value) forecastWeather,
    required TResult Function(WeatherNotifyState value) notifyUser,
  }) {
    return todayWeather(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
  }) {
    return todayWeather?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
    required TResult orElse(),
  }) {
    if (todayWeather != null) {
      return todayWeather(this);
    }
    return orElse();
  }
}

abstract class WeatherTodayState implements WeatherState {
  const factory WeatherTodayState(WeatherModel currentWeatherModel) =
      _$WeatherTodayState;

  WeatherModel get currentWeatherModel;
  @JsonKey(ignore: true)
  $WeatherTodayStateCopyWith<WeatherTodayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastStateCopyWith<$Res> {
  factory $WeatherForecastStateCopyWith(WeatherForecastState value,
          $Res Function(WeatherForecastState) then) =
      _$WeatherForecastStateCopyWithImpl<$Res>;
  $Res call({List<WeatherModel>? forecastWeatherModel});
}

/// @nodoc
class _$WeatherForecastStateCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements $WeatherForecastStateCopyWith<$Res> {
  _$WeatherForecastStateCopyWithImpl(
      WeatherForecastState _value, $Res Function(WeatherForecastState) _then)
      : super(_value, (v) => _then(v as WeatherForecastState));

  @override
  WeatherForecastState get _value => super._value as WeatherForecastState;

  @override
  $Res call({
    Object? forecastWeatherModel = freezed,
  }) {
    return _then(WeatherForecastState(
      forecastWeatherModel == freezed
          ? _value.forecastWeatherModel
          : forecastWeatherModel // ignore: cast_nullable_to_non_nullable
              as List<WeatherModel>?,
    ));
  }
}

/// @nodoc

class _$WeatherForecastState implements WeatherForecastState {
  const _$WeatherForecastState(this.forecastWeatherModel);

  @override
  final List<WeatherModel>? forecastWeatherModel;

  @override
  String toString() {
    return 'WeatherState.forecastWeather(forecastWeatherModel: $forecastWeatherModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherForecastState &&
            const DeepCollectionEquality()
                .equals(other.forecastWeatherModel, forecastWeatherModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(forecastWeatherModel));

  @JsonKey(ignore: true)
  @override
  $WeatherForecastStateCopyWith<WeatherForecastState> get copyWith =>
      _$WeatherForecastStateCopyWithImpl<WeatherForecastState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(WeatherModel currentWeatherModel) todayWeather,
    required TResult Function(List<WeatherModel>? forecastWeatherModel)
        forecastWeather,
    required TResult Function(String message) notifyUser,
  }) {
    return forecastWeather(forecastWeatherModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
  }) {
    return forecastWeather?.call(forecastWeatherModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
    required TResult orElse(),
  }) {
    if (forecastWeather != null) {
      return forecastWeather(forecastWeatherModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherInitState value) init,
    required TResult Function(WeatherLoadingState value) loading,
    required TResult Function(WeatherErrorState value) error,
    required TResult Function(WeatherTodayState value) todayWeather,
    required TResult Function(WeatherForecastState value) forecastWeather,
    required TResult Function(WeatherNotifyState value) notifyUser,
  }) {
    return forecastWeather(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
  }) {
    return forecastWeather?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
    required TResult orElse(),
  }) {
    if (forecastWeather != null) {
      return forecastWeather(this);
    }
    return orElse();
  }
}

abstract class WeatherForecastState implements WeatherState {
  const factory WeatherForecastState(List<WeatherModel>? forecastWeatherModel) =
      _$WeatherForecastState;

  List<WeatherModel>? get forecastWeatherModel;
  @JsonKey(ignore: true)
  $WeatherForecastStateCopyWith<WeatherForecastState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherNotifyStateCopyWith<$Res> {
  factory $WeatherNotifyStateCopyWith(
          WeatherNotifyState value, $Res Function(WeatherNotifyState) then) =
      _$WeatherNotifyStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$WeatherNotifyStateCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements $WeatherNotifyStateCopyWith<$Res> {
  _$WeatherNotifyStateCopyWithImpl(
      WeatherNotifyState _value, $Res Function(WeatherNotifyState) _then)
      : super(_value, (v) => _then(v as WeatherNotifyState));

  @override
  WeatherNotifyState get _value => super._value as WeatherNotifyState;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(WeatherNotifyState(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WeatherNotifyState implements WeatherNotifyState {
  const _$WeatherNotifyState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'WeatherState.notifyUser(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherNotifyState &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $WeatherNotifyStateCopyWith<WeatherNotifyState> get copyWith =>
      _$WeatherNotifyStateCopyWithImpl<WeatherNotifyState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(WeatherModel currentWeatherModel) todayWeather,
    required TResult Function(List<WeatherModel>? forecastWeatherModel)
        forecastWeather,
    required TResult Function(String message) notifyUser,
  }) {
    return notifyUser(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
  }) {
    return notifyUser?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(WeatherModel currentWeatherModel)? todayWeather,
    TResult Function(List<WeatherModel>? forecastWeatherModel)? forecastWeather,
    TResult Function(String message)? notifyUser,
    required TResult orElse(),
  }) {
    if (notifyUser != null) {
      return notifyUser(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherInitState value) init,
    required TResult Function(WeatherLoadingState value) loading,
    required TResult Function(WeatherErrorState value) error,
    required TResult Function(WeatherTodayState value) todayWeather,
    required TResult Function(WeatherForecastState value) forecastWeather,
    required TResult Function(WeatherNotifyState value) notifyUser,
  }) {
    return notifyUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
  }) {
    return notifyUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherInitState value)? init,
    TResult Function(WeatherLoadingState value)? loading,
    TResult Function(WeatherErrorState value)? error,
    TResult Function(WeatherTodayState value)? todayWeather,
    TResult Function(WeatherForecastState value)? forecastWeather,
    TResult Function(WeatherNotifyState value)? notifyUser,
    required TResult orElse(),
  }) {
    if (notifyUser != null) {
      return notifyUser(this);
    }
    return orElse();
  }
}

abstract class WeatherNotifyState implements WeatherState {
  const factory WeatherNotifyState(String message) = _$WeatherNotifyState;

  String get message;
  @JsonKey(ignore: true)
  $WeatherNotifyStateCopyWith<WeatherNotifyState> get copyWith =>
      throw _privateConstructorUsedError;
}
