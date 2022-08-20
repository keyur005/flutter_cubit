import 'package:cubit_bloc_demo/core/utils/enum.dart';


class APIResult<T> {
  late APIResultType apiResultType;
  String? message;
  T? result;

  APIResult.loading({this.result}) : assert(T != dynamic) {
    apiResultType = APIResultType.LOADING;
    // message = AppString.LOADING;
  }

  APIResult.noInternet() : assert(T != dynamic) {
    apiResultType = APIResultType.NO_INTERNET;
    // message = AppString.NO_INTERNET_CONNECTION;
    result = null;
  }

  APIResult.success(this.message, this.result) : assert(T != dynamic) {
    apiResultType = APIResultType.SUCCESS;
  }

  APIResult.failure(this.message, {this.result}) : assert(T != dynamic) {
    apiResultType = APIResultType.FAILURE;
  }

  APIResult.userUnauthorised() : assert(T != dynamic) {
    apiResultType = APIResultType.UNAUTHORISED;
  }

  APIResult.userDeleted() : assert(T != dynamic) {
    apiResultType = APIResultType.NOTFOUND;
  }

  APIResult.sessionExpired() : assert(T != dynamic) {
    apiResultType = APIResultType.SESSION_EXPIRED;
    // message = AppString.SESSION_EXPIRED;
    result = null;
  }

  static bool isLoading(APIResult? value) =>
      value != null && value.apiResultType == APIResultType.LOADING;

  @override
  String toString() {
    return 'APIResult{apiResultType: $apiResultType, message: $message, data: $result}';
  }
}
