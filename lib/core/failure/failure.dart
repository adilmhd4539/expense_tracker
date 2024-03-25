import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  static String getErrorMessage(Failure error) {
    return error.when(
      netWorkFailure: () => 'No network connection please ty again',
      timeOut: () =>
          'Connection time out please check your network connection or try again later',
      unknownFailure: (message) =>
          message ?? 'Somthing went wrong please try again later',
    );
  }

  const factory Failure.netWorkFailure() = NetWorkFailure;
  const factory Failure.timeOut() = TimeOut;
  const factory Failure.unknownFailure({String? message}) = UnknownFailure;
}
