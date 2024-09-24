// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserCubitState {
  UserData? get userData => throw _privateConstructorUsedError;
  List<UserData> get usersToShare => throw _privateConstructorUsedError;

  /// Create a copy of UserCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCubitStateCopyWith<UserCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCubitStateCopyWith<$Res> {
  factory $UserCubitStateCopyWith(
          UserCubitState value, $Res Function(UserCubitState) then) =
      _$UserCubitStateCopyWithImpl<$Res, UserCubitState>;
  @useResult
  $Res call({UserData? userData, List<UserData> usersToShare});

  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class _$UserCubitStateCopyWithImpl<$Res, $Val extends UserCubitState>
    implements $UserCubitStateCopyWith<$Res> {
  _$UserCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = freezed,
    Object? usersToShare = null,
  }) {
    return _then(_value.copyWith(
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      usersToShare: null == usersToShare
          ? _value.usersToShare
          : usersToShare // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
    ) as $Val);
  }

  /// Create a copy of UserCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserCubitStateImplCopyWith<$Res>
    implements $UserCubitStateCopyWith<$Res> {
  factory _$$UserCubitStateImplCopyWith(_$UserCubitStateImpl value,
          $Res Function(_$UserCubitStateImpl) then) =
      __$$UserCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserData? userData, List<UserData> usersToShare});

  @override
  $UserDataCopyWith<$Res>? get userData;
}

/// @nodoc
class __$$UserCubitStateImplCopyWithImpl<$Res>
    extends _$UserCubitStateCopyWithImpl<$Res, _$UserCubitStateImpl>
    implements _$$UserCubitStateImplCopyWith<$Res> {
  __$$UserCubitStateImplCopyWithImpl(
      _$UserCubitStateImpl _value, $Res Function(_$UserCubitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = freezed,
    Object? usersToShare = null,
  }) {
    return _then(_$UserCubitStateImpl(
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
      usersToShare: null == usersToShare
          ? _value._usersToShare
          : usersToShare // ignore: cast_nullable_to_non_nullable
              as List<UserData>,
    ));
  }
}

/// @nodoc

class _$UserCubitStateImpl implements _UserCubitState {
  _$UserCubitStateImpl(
      {required this.userData, required final List<UserData> usersToShare})
      : _usersToShare = usersToShare;

  @override
  final UserData? userData;
  final List<UserData> _usersToShare;
  @override
  List<UserData> get usersToShare {
    if (_usersToShare is EqualUnmodifiableListView) return _usersToShare;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersToShare);
  }

  @override
  String toString() {
    return 'UserCubitState(userData: $userData, usersToShare: $usersToShare)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCubitStateImpl &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            const DeepCollectionEquality()
                .equals(other._usersToShare, _usersToShare));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userData,
      const DeepCollectionEquality().hash(_usersToShare));

  /// Create a copy of UserCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCubitStateImplCopyWith<_$UserCubitStateImpl> get copyWith =>
      __$$UserCubitStateImplCopyWithImpl<_$UserCubitStateImpl>(
          this, _$identity);
}

abstract class _UserCubitState implements UserCubitState {
  factory _UserCubitState(
      {required final UserData? userData,
      required final List<UserData> usersToShare}) = _$UserCubitStateImpl;

  @override
  UserData? get userData;
  @override
  List<UserData> get usersToShare;

  /// Create a copy of UserCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCubitStateImplCopyWith<_$UserCubitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
