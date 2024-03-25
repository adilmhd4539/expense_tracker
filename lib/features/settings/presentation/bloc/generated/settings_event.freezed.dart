// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotification,
    required TResult Function(
            Notification notification, Notification currentNotification)
        updateNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNotification,
    TResult? Function(
            Notification notification, Notification currentNotification)?
        updateNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotification,
    TResult Function(
            Notification notification, Notification currentNotification)?
        updateNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotification value) getNotification,
    required TResult Function(UpdateNotification value) updateNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotification value)? getNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotification value)? getNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res, SettingsEvent>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res, $Val extends SettingsEvent>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetNotificationImplCopyWith<$Res> {
  factory _$$GetNotificationImplCopyWith(_$GetNotificationImpl value,
          $Res Function(_$GetNotificationImpl) then) =
      __$$GetNotificationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetNotificationImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$GetNotificationImpl>
    implements _$$GetNotificationImplCopyWith<$Res> {
  __$$GetNotificationImplCopyWithImpl(
      _$GetNotificationImpl _value, $Res Function(_$GetNotificationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetNotificationImpl implements GetNotification {
  const _$GetNotificationImpl();

  @override
  String toString() {
    return 'SettingsEvent.getNotification()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetNotificationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotification,
    required TResult Function(
            Notification notification, Notification currentNotification)
        updateNotification,
  }) {
    return getNotification();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNotification,
    TResult? Function(
            Notification notification, Notification currentNotification)?
        updateNotification,
  }) {
    return getNotification?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotification,
    TResult Function(
            Notification notification, Notification currentNotification)?
        updateNotification,
    required TResult orElse(),
  }) {
    if (getNotification != null) {
      return getNotification();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotification value) getNotification,
    required TResult Function(UpdateNotification value) updateNotification,
  }) {
    return getNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotification value)? getNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
  }) {
    return getNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotification value)? getNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    required TResult orElse(),
  }) {
    if (getNotification != null) {
      return getNotification(this);
    }
    return orElse();
  }
}

abstract class GetNotification implements SettingsEvent {
  const factory GetNotification() = _$GetNotificationImpl;
}

/// @nodoc
abstract class _$$UpdateNotificationImplCopyWith<$Res> {
  factory _$$UpdateNotificationImplCopyWith(_$UpdateNotificationImpl value,
          $Res Function(_$UpdateNotificationImpl) then) =
      __$$UpdateNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Notification notification, Notification currentNotification});

  $NotificationCopyWith<$Res> get notification;
  $NotificationCopyWith<$Res> get currentNotification;
}

/// @nodoc
class __$$UpdateNotificationImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$UpdateNotificationImpl>
    implements _$$UpdateNotificationImplCopyWith<$Res> {
  __$$UpdateNotificationImplCopyWithImpl(_$UpdateNotificationImpl _value,
      $Res Function(_$UpdateNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
    Object? currentNotification = null,
  }) {
    return _then(_$UpdateNotificationImpl(
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Notification,
      currentNotification: null == currentNotification
          ? _value.currentNotification
          : currentNotification // ignore: cast_nullable_to_non_nullable
              as Notification,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationCopyWith<$Res> get notification {
    return $NotificationCopyWith<$Res>(_value.notification, (value) {
      return _then(_value.copyWith(notification: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationCopyWith<$Res> get currentNotification {
    return $NotificationCopyWith<$Res>(_value.currentNotification, (value) {
      return _then(_value.copyWith(currentNotification: value));
    });
  }
}

/// @nodoc

class _$UpdateNotificationImpl implements UpdateNotification {
  const _$UpdateNotificationImpl(
      {required this.notification, required this.currentNotification});

  @override
  final Notification notification;
  @override
  final Notification currentNotification;

  @override
  String toString() {
    return 'SettingsEvent.updateNotification(notification: $notification, currentNotification: $currentNotification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNotificationImpl &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.currentNotification, currentNotification) ||
                other.currentNotification == currentNotification));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, notification, currentNotification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNotificationImplCopyWith<_$UpdateNotificationImpl> get copyWith =>
      __$$UpdateNotificationImplCopyWithImpl<_$UpdateNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNotification,
    required TResult Function(
            Notification notification, Notification currentNotification)
        updateNotification,
  }) {
    return updateNotification(notification, currentNotification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getNotification,
    TResult? Function(
            Notification notification, Notification currentNotification)?
        updateNotification,
  }) {
    return updateNotification?.call(notification, currentNotification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNotification,
    TResult Function(
            Notification notification, Notification currentNotification)?
        updateNotification,
    required TResult orElse(),
  }) {
    if (updateNotification != null) {
      return updateNotification(notification, currentNotification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetNotification value) getNotification,
    required TResult Function(UpdateNotification value) updateNotification,
  }) {
    return updateNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetNotification value)? getNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
  }) {
    return updateNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetNotification value)? getNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    required TResult orElse(),
  }) {
    if (updateNotification != null) {
      return updateNotification(this);
    }
    return orElse();
  }
}

abstract class UpdateNotification implements SettingsEvent {
  const factory UpdateNotification(
          {required final Notification notification,
          required final Notification currentNotification}) =
      _$UpdateNotificationImpl;

  Notification get notification;
  Notification get currentNotification;
  @JsonKey(ignore: true)
  _$$UpdateNotificationImplCopyWith<_$UpdateNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
