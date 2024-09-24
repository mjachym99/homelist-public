// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_nav_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BottomNavCubitState {
  int get currentPageIndex => throw _privateConstructorUsedError;

  /// Create a copy of BottomNavCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BottomNavCubitStateCopyWith<BottomNavCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavCubitStateCopyWith<$Res> {
  factory $BottomNavCubitStateCopyWith(
          BottomNavCubitState value, $Res Function(BottomNavCubitState) then) =
      _$BottomNavCubitStateCopyWithImpl<$Res, BottomNavCubitState>;
  @useResult
  $Res call({int currentPageIndex});
}

/// @nodoc
class _$BottomNavCubitStateCopyWithImpl<$Res, $Val extends BottomNavCubitState>
    implements $BottomNavCubitStateCopyWith<$Res> {
  _$BottomNavCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BottomNavCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPageIndex = null,
  }) {
    return _then(_value.copyWith(
      currentPageIndex: null == currentPageIndex
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BottomNavCubitStateImplCopyWith<$Res>
    implements $BottomNavCubitStateCopyWith<$Res> {
  factory _$$BottomNavCubitStateImplCopyWith(_$BottomNavCubitStateImpl value,
          $Res Function(_$BottomNavCubitStateImpl) then) =
      __$$BottomNavCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentPageIndex});
}

/// @nodoc
class __$$BottomNavCubitStateImplCopyWithImpl<$Res>
    extends _$BottomNavCubitStateCopyWithImpl<$Res, _$BottomNavCubitStateImpl>
    implements _$$BottomNavCubitStateImplCopyWith<$Res> {
  __$$BottomNavCubitStateImplCopyWithImpl(_$BottomNavCubitStateImpl _value,
      $Res Function(_$BottomNavCubitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BottomNavCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPageIndex = null,
  }) {
    return _then(_$BottomNavCubitStateImpl(
      currentPageIndex: null == currentPageIndex
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BottomNavCubitStateImpl implements _BottomNavCubitState {
  _$BottomNavCubitStateImpl({required this.currentPageIndex});

  @override
  final int currentPageIndex;

  @override
  String toString() {
    return 'BottomNavCubitState(currentPageIndex: $currentPageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomNavCubitStateImpl &&
            (identical(other.currentPageIndex, currentPageIndex) ||
                other.currentPageIndex == currentPageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPageIndex);

  /// Create a copy of BottomNavCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomNavCubitStateImplCopyWith<_$BottomNavCubitStateImpl> get copyWith =>
      __$$BottomNavCubitStateImplCopyWithImpl<_$BottomNavCubitStateImpl>(
          this, _$identity);
}

abstract class _BottomNavCubitState implements BottomNavCubitState {
  factory _BottomNavCubitState({required final int currentPageIndex}) =
      _$BottomNavCubitStateImpl;

  @override
  int get currentPageIndex;

  /// Create a copy of BottomNavCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottomNavCubitStateImplCopyWith<_$BottomNavCubitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
