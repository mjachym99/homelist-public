// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  bool get isAuthenticated => throw _privateConstructorUsedError;
  bool get staySignedIn => throw _privateConstructorUsedError;
  Status get authStatus => throw _privateConstructorUsedError;
  bool get signUp => throw _privateConstructorUsedError;
  AuthRepositoryException? get authException =>
      throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {bool isAuthenticated,
      bool staySignedIn,
      Status authStatus,
      bool signUp,
      AuthRepositoryException? authException});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticated = null,
    Object? staySignedIn = null,
    Object? authStatus = null,
    Object? signUp = null,
    Object? authException = freezed,
  }) {
    return _then(_value.copyWith(
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      staySignedIn: null == staySignedIn
          ? _value.staySignedIn
          : staySignedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      signUp: null == signUp
          ? _value.signUp
          : signUp // ignore: cast_nullable_to_non_nullable
              as bool,
      authException: freezed == authException
          ? _value.authException
          : authException // ignore: cast_nullable_to_non_nullable
              as AuthRepositoryException?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAuthenticated,
      bool staySignedIn,
      Status authStatus,
      bool signUp,
      AuthRepositoryException? authException});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthenticated = null,
    Object? staySignedIn = null,
    Object? authStatus = null,
    Object? signUp = null,
    Object? authException = freezed,
  }) {
    return _then(_$AuthStateImpl(
      isAuthenticated: null == isAuthenticated
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      staySignedIn: null == staySignedIn
          ? _value.staySignedIn
          : staySignedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      signUp: null == signUp
          ? _value.signUp
          : signUp // ignore: cast_nullable_to_non_nullable
              as bool,
      authException: freezed == authException
          ? _value.authException
          : authException // ignore: cast_nullable_to_non_nullable
              as AuthRepositoryException?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {required this.isAuthenticated,
      required this.staySignedIn,
      required this.authStatus,
      required this.signUp,
      this.authException});

  @override
  final bool isAuthenticated;
  @override
  final bool staySignedIn;
  @override
  final Status authStatus;
  @override
  final bool signUp;
  @override
  final AuthRepositoryException? authException;

  @override
  String toString() {
    return 'AuthState(isAuthenticated: $isAuthenticated, staySignedIn: $staySignedIn, authStatus: $authStatus, signUp: $signUp, authException: $authException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.staySignedIn, staySignedIn) ||
                other.staySignedIn == staySignedIn) &&
            (identical(other.authStatus, authStatus) ||
                other.authStatus == authStatus) &&
            (identical(other.signUp, signUp) || other.signUp == signUp) &&
            (identical(other.authException, authException) ||
                other.authException == authException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAuthenticated, staySignedIn,
      authStatus, signUp, authException);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final bool isAuthenticated,
      required final bool staySignedIn,
      required final Status authStatus,
      required final bool signUp,
      final AuthRepositoryException? authException}) = _$AuthStateImpl;

  @override
  bool get isAuthenticated;
  @override
  bool get staySignedIn;
  @override
  Status get authStatus;
  @override
  bool get signUp;
  @override
  AuthRepositoryException? get authException;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
