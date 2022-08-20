

import 'package:cubit_bloc_demo/core/utils/enum.dart';

class NetworkResult {
  NetworkResultType networkResultType;
  String? result;

  NetworkResult._(this.networkResultType, this.result);

  static NetworkResult noInternet() {
    return NetworkResult._(NetworkResultType.NO_INTERNET, null);
  }

  static NetworkResult success(String data) {
    return NetworkResult._(NetworkResultType.SUCCESS, data);
  }

  static NetworkResult error(String data) {
    return NetworkResult._(NetworkResultType.ERROR, data);
  }

  static NetworkResult unAuthorised() {
    return NetworkResult._(NetworkResultType.UNAUTHORISED, null);
  }

  static NetworkResult notFound() {
    return NetworkResult._(NetworkResultType.NOTFOUND, null);
  }

  @override
  String toString() {
    return 'NetworkResult{networkResultType: $networkResultType, data: $result}';
  }
}
