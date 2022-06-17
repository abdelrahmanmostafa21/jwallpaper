// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ViewStateTearOff {
  const _$ViewStateTearOff();

  _Idle idle() {
    return const _Idle();
  }

  _Error error({String? error}) {
    return _Error(
      error: error,
    );
  }

  _Loading loading() {
    return const _Loading();
  }

  _LoadingMore loadingMore() {
    return const _LoadingMore();
  }

  _NoMoreData noMoreData() {
    return const _NoMoreData();
  }

  _DataAvailable dataAvailable() {
    return const _DataAvailable();
  }

  _NoDataAvailable noDataAvailable() {
    return const _NoDataAvailable();
  }

  CustomMessage customMessage(String msg) {
    return CustomMessage(
      msg,
    );
  }
}

/// @nodoc
const $ViewState = _$ViewStateTearOff();

/// @nodoc
mixin _$ViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String? error) error,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() noMoreData,
    required TResult Function() dataAvailable,
    required TResult Function() noDataAvailable,
    required TResult Function(String msg) customMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_NoMoreData value) noMoreData,
    required TResult Function(_DataAvailable value) dataAvailable,
    required TResult Function(_NoDataAvailable value) noDataAvailable,
    required TResult Function(CustomMessage value) customMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewStateCopyWith<$Res> {
  factory $ViewStateCopyWith(ViewState value, $Res Function(ViewState) then) =
      _$ViewStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ViewStateCopyWithImpl<$Res> implements $ViewStateCopyWith<$Res> {
  _$ViewStateCopyWithImpl(this._value, this._then);

  final ViewState _value;
  // ignore: unused_field
  final $Res Function(ViewState) _then;
}

/// @nodoc
abstract class _$IdleCopyWith<$Res> {
  factory _$IdleCopyWith(_Idle value, $Res Function(_Idle) then) =
      __$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$IdleCopyWithImpl<$Res> extends _$ViewStateCopyWithImpl<$Res>
    implements _$IdleCopyWith<$Res> {
  __$IdleCopyWithImpl(_Idle _value, $Res Function(_Idle) _then)
      : super(_value, (v) => _then(v as _Idle));

  @override
  _Idle get _value => super._value as _Idle;
}

/// @nodoc

class _$_Idle implements _Idle {
  const _$_Idle();

  @override
  String toString() {
    return 'ViewState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String? error) error,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() noMoreData,
    required TResult Function() dataAvailable,
    required TResult Function() noDataAvailable,
    required TResult Function(String msg) customMessage,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_NoMoreData value) noMoreData,
    required TResult Function(_DataAvailable value) dataAvailable,
    required TResult Function(_NoDataAvailable value) noDataAvailable,
    required TResult Function(CustomMessage value) customMessage,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements ViewState {
  const factory _Idle() = _$_Idle;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String? error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$ViewStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Error(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'ViewState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String? error) error,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() noMoreData,
    required TResult Function() dataAvailable,
    required TResult Function() noDataAvailable,
    required TResult Function(String msg) customMessage,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_NoMoreData value) noMoreData,
    required TResult Function(_DataAvailable value) dataAvailable,
    required TResult Function(_NoDataAvailable value) noDataAvailable,
    required TResult Function(CustomMessage value) customMessage,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ViewState {
  const factory _Error({String? error}) = _$_Error;

  String? get error;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$ViewStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'ViewState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String? error) error,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() noMoreData,
    required TResult Function() dataAvailable,
    required TResult Function() noDataAvailable,
    required TResult Function(String msg) customMessage,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
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
    required TResult Function(_Idle value) idle,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_NoMoreData value) noMoreData,
    required TResult Function(_DataAvailable value) dataAvailable,
    required TResult Function(_NoDataAvailable value) noDataAvailable,
    required TResult Function(CustomMessage value) customMessage,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ViewState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadingMoreCopyWith<$Res> {
  factory _$LoadingMoreCopyWith(
          _LoadingMore value, $Res Function(_LoadingMore) then) =
      __$LoadingMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingMoreCopyWithImpl<$Res> extends _$ViewStateCopyWithImpl<$Res>
    implements _$LoadingMoreCopyWith<$Res> {
  __$LoadingMoreCopyWithImpl(
      _LoadingMore _value, $Res Function(_LoadingMore) _then)
      : super(_value, (v) => _then(v as _LoadingMore));

  @override
  _LoadingMore get _value => super._value as _LoadingMore;
}

/// @nodoc

class _$_LoadingMore implements _LoadingMore {
  const _$_LoadingMore();

  @override
  String toString() {
    return 'ViewState.loadingMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadingMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String? error) error,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() noMoreData,
    required TResult Function() dataAvailable,
    required TResult Function() noDataAvailable,
    required TResult Function(String msg) customMessage,
  }) {
    return loadingMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
  }) {
    return loadingMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_NoMoreData value) noMoreData,
    required TResult Function(_DataAvailable value) dataAvailable,
    required TResult Function(_NoDataAvailable value) noDataAvailable,
    required TResult Function(CustomMessage value) customMessage,
  }) {
    return loadingMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
  }) {
    return loadingMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
    required TResult orElse(),
  }) {
    if (loadingMore != null) {
      return loadingMore(this);
    }
    return orElse();
  }
}

abstract class _LoadingMore implements ViewState {
  const factory _LoadingMore() = _$_LoadingMore;
}

/// @nodoc
abstract class _$NoMoreDataCopyWith<$Res> {
  factory _$NoMoreDataCopyWith(
          _NoMoreData value, $Res Function(_NoMoreData) then) =
      __$NoMoreDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$NoMoreDataCopyWithImpl<$Res> extends _$ViewStateCopyWithImpl<$Res>
    implements _$NoMoreDataCopyWith<$Res> {
  __$NoMoreDataCopyWithImpl(
      _NoMoreData _value, $Res Function(_NoMoreData) _then)
      : super(_value, (v) => _then(v as _NoMoreData));

  @override
  _NoMoreData get _value => super._value as _NoMoreData;
}

/// @nodoc

class _$_NoMoreData implements _NoMoreData {
  const _$_NoMoreData();

  @override
  String toString() {
    return 'ViewState.noMoreData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NoMoreData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String? error) error,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() noMoreData,
    required TResult Function() dataAvailable,
    required TResult Function() noDataAvailable,
    required TResult Function(String msg) customMessage,
  }) {
    return noMoreData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
  }) {
    return noMoreData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
    required TResult orElse(),
  }) {
    if (noMoreData != null) {
      return noMoreData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_NoMoreData value) noMoreData,
    required TResult Function(_DataAvailable value) dataAvailable,
    required TResult Function(_NoDataAvailable value) noDataAvailable,
    required TResult Function(CustomMessage value) customMessage,
  }) {
    return noMoreData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
  }) {
    return noMoreData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
    required TResult orElse(),
  }) {
    if (noMoreData != null) {
      return noMoreData(this);
    }
    return orElse();
  }
}

abstract class _NoMoreData implements ViewState {
  const factory _NoMoreData() = _$_NoMoreData;
}

/// @nodoc
abstract class _$DataAvailableCopyWith<$Res> {
  factory _$DataAvailableCopyWith(
          _DataAvailable value, $Res Function(_DataAvailable) then) =
      __$DataAvailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$DataAvailableCopyWithImpl<$Res> extends _$ViewStateCopyWithImpl<$Res>
    implements _$DataAvailableCopyWith<$Res> {
  __$DataAvailableCopyWithImpl(
      _DataAvailable _value, $Res Function(_DataAvailable) _then)
      : super(_value, (v) => _then(v as _DataAvailable));

  @override
  _DataAvailable get _value => super._value as _DataAvailable;
}

/// @nodoc

class _$_DataAvailable implements _DataAvailable {
  const _$_DataAvailable();

  @override
  String toString() {
    return 'ViewState.dataAvailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DataAvailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String? error) error,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() noMoreData,
    required TResult Function() dataAvailable,
    required TResult Function() noDataAvailable,
    required TResult Function(String msg) customMessage,
  }) {
    return dataAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
  }) {
    return dataAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
    required TResult orElse(),
  }) {
    if (dataAvailable != null) {
      return dataAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_NoMoreData value) noMoreData,
    required TResult Function(_DataAvailable value) dataAvailable,
    required TResult Function(_NoDataAvailable value) noDataAvailable,
    required TResult Function(CustomMessage value) customMessage,
  }) {
    return dataAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
  }) {
    return dataAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
    required TResult orElse(),
  }) {
    if (dataAvailable != null) {
      return dataAvailable(this);
    }
    return orElse();
  }
}

abstract class _DataAvailable implements ViewState {
  const factory _DataAvailable() = _$_DataAvailable;
}

/// @nodoc
abstract class _$NoDataAvailableCopyWith<$Res> {
  factory _$NoDataAvailableCopyWith(
          _NoDataAvailable value, $Res Function(_NoDataAvailable) then) =
      __$NoDataAvailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$NoDataAvailableCopyWithImpl<$Res> extends _$ViewStateCopyWithImpl<$Res>
    implements _$NoDataAvailableCopyWith<$Res> {
  __$NoDataAvailableCopyWithImpl(
      _NoDataAvailable _value, $Res Function(_NoDataAvailable) _then)
      : super(_value, (v) => _then(v as _NoDataAvailable));

  @override
  _NoDataAvailable get _value => super._value as _NoDataAvailable;
}

/// @nodoc

class _$_NoDataAvailable implements _NoDataAvailable {
  const _$_NoDataAvailable();

  @override
  String toString() {
    return 'ViewState.noDataAvailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NoDataAvailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String? error) error,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() noMoreData,
    required TResult Function() dataAvailable,
    required TResult Function() noDataAvailable,
    required TResult Function(String msg) customMessage,
  }) {
    return noDataAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
  }) {
    return noDataAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
    required TResult orElse(),
  }) {
    if (noDataAvailable != null) {
      return noDataAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_NoMoreData value) noMoreData,
    required TResult Function(_DataAvailable value) dataAvailable,
    required TResult Function(_NoDataAvailable value) noDataAvailable,
    required TResult Function(CustomMessage value) customMessage,
  }) {
    return noDataAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
  }) {
    return noDataAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
    required TResult orElse(),
  }) {
    if (noDataAvailable != null) {
      return noDataAvailable(this);
    }
    return orElse();
  }
}

abstract class _NoDataAvailable implements ViewState {
  const factory _NoDataAvailable() = _$_NoDataAvailable;
}

/// @nodoc
abstract class $CustomMessageCopyWith<$Res> {
  factory $CustomMessageCopyWith(
          CustomMessage value, $Res Function(CustomMessage) then) =
      _$CustomMessageCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class _$CustomMessageCopyWithImpl<$Res> extends _$ViewStateCopyWithImpl<$Res>
    implements $CustomMessageCopyWith<$Res> {
  _$CustomMessageCopyWithImpl(
      CustomMessage _value, $Res Function(CustomMessage) _then)
      : super(_value, (v) => _then(v as CustomMessage));

  @override
  CustomMessage get _value => super._value as CustomMessage;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(CustomMessage(
      msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomMessage implements CustomMessage {
  const _$CustomMessage(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'ViewState.customMessage(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomMessage &&
            const DeepCollectionEquality().equals(other.msg, msg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(msg));

  @JsonKey(ignore: true)
  @override
  $CustomMessageCopyWith<CustomMessage> get copyWith =>
      _$CustomMessageCopyWithImpl<CustomMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String? error) error,
    required TResult Function() loading,
    required TResult Function() loadingMore,
    required TResult Function() noMoreData,
    required TResult Function() dataAvailable,
    required TResult Function() noDataAvailable,
    required TResult Function(String msg) customMessage,
  }) {
    return customMessage(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
  }) {
    return customMessage?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String? error)? error,
    TResult Function()? loading,
    TResult Function()? loadingMore,
    TResult Function()? noMoreData,
    TResult Function()? dataAvailable,
    TResult Function()? noDataAvailable,
    TResult Function(String msg)? customMessage,
    required TResult orElse(),
  }) {
    if (customMessage != null) {
      return customMessage(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingMore value) loadingMore,
    required TResult Function(_NoMoreData value) noMoreData,
    required TResult Function(_DataAvailable value) dataAvailable,
    required TResult Function(_NoDataAvailable value) noDataAvailable,
    required TResult Function(CustomMessage value) customMessage,
  }) {
    return customMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
  }) {
    return customMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingMore value)? loadingMore,
    TResult Function(_NoMoreData value)? noMoreData,
    TResult Function(_DataAvailable value)? dataAvailable,
    TResult Function(_NoDataAvailable value)? noDataAvailable,
    TResult Function(CustomMessage value)? customMessage,
    required TResult orElse(),
  }) {
    if (customMessage != null) {
      return customMessage(this);
    }
    return orElse();
  }
}

abstract class CustomMessage implements ViewState {
  const factory CustomMessage(String msg) = _$CustomMessage;

  String get msg;
  @JsonKey(ignore: true)
  $CustomMessageCopyWith<CustomMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
