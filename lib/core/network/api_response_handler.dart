import 'dart:convert';

import 'package:cubit_bloc_demo/core/model/weather_response_model_entity.dart';
import 'package:cubit_bloc_demo/core/network/api_result.dart';
import 'package:cubit_bloc_demo/core/network/base_response_model_entity.dart';
import 'package:cubit_bloc_demo/core/network/network_result.dart';
import 'package:cubit_bloc_demo/core/utils/enum.dart';
import 'package:cubit_bloc_demo/core/utils/extension.dart';
import 'package:cubit_bloc_demo/core/utils/logger_util.dart';
import 'package:cubit_bloc_demo/generated/json/base/json_convert_content.dart';

APIResult<T> getAPIResultFromNetwork<T>(NetworkResult networkResult) {
  switch (networkResult.networkResultType) {
    case NetworkResultType.SUCCESS:
      if (networkResult.result.isNullOrEmpty()) {
        logger.w("user isNullOrEmpty");
        return APIResult.failure("");
      }
      try {
        var baseJson = json.decode(networkResult.result!);

        print("baseJson=====>n ${baseJson.toString()}");
        WeatherResponseModelEntity weatherResponseModelEntity =
            WeatherResponseModelEntity.fromJson(baseJson);

        return APIResult.success("keyur", weatherResponseModelEntity as T);

        // BaseResponseModelEntity baseResponseEntity = BaseResponseModelEntity.fromJson(baseJson);
        // BaseResponseModel baseResponseEntity = JsonConvert.fromJsonAsT(baseJson);

        /*if (baseJson.cod == APIResultConstant.ERROR) {
            logger.w("user ERROR");
            return APIResult.failure(baseResponseEntity.message.orEmpty());
          } else if (baseResponseEntity.cod == APIResultConstant.USER_UNAUTHORISED) {
            logger.w("user unautorized");
           // navigateToPageAndRemoveAllPage(GlobalVariable.navigatorKey.currentContext!, LOGIN_ROUTE,);
            return APIResult.userUnauthorised();
          } else if (baseResponseEntity.cod == APIResultConstant.USER_DELETED) {
            logger.w("user USER_DELETED");
            return APIResult.userDeleted();
          } else {
            if (baseResponseEntity.weather != null) {
              if (baseResponseEntity.weather.runtimeType != String) {
              T? responseModel = JsonConvert.fromJsonAsT<T>(baseResponseEntity.weather);

              return APIResult.success(
                  baseResponseEntity.message.orEmpty(), responseModel);
            }
              print('base response ====== ${baseResponseEntity.weather}');
              return APIResult.success(baseResponseEntity.message.orEmpty(),
                  baseResponseEntity.weather);
            }
              else {
              return APIResult.success(
                  baseResponseEntity.message.orEmpty(), null);
            }
          }*/
      } catch (e, s) {
        logger.w("result failure catch");
        //   FirebaseCrashlytics.instance.recordError(e, s);
        return APIResult.failure("ERROR");
      }

    default:
      {
        logger.wtf(networkResult.toString());
        var baseJson = json.decode(networkResult.result!);

        print("baseJson=====>n ${baseJson.toString()}");
        BaseResponseModelEntity baseResponseModelEntity =
            BaseResponseModelEntity.fromJson(baseJson);

        return APIResult.failure(
          baseResponseModelEntity.message,
        );
      }
  }
}

APIResult<T> getAPIResultFromNetworkWithoutBase<T>(
    NetworkResult networkResult) {
  switch (networkResult.networkResultType) {
    case NetworkResultType.ERROR:
      return APIResult.failure("ERROR");
    case NetworkResultType.NO_INTERNET:
      return APIResult.noInternet();
    case NetworkResultType.UNAUTHORISED:
      return APIResult.userUnauthorised();
    case NetworkResultType.NOTFOUND:
      return APIResult.userDeleted();
    case NetworkResultType.SUCCESS:
    default:
      {
        if (networkResult.result.isNullOrEmpty()) {
          return APIResult.failure("");
        }
        try {
          if (networkResult.result != null) {
            var baseJson = json.decode(networkResult.result!);
            T? responseModel = JsonConvert.fromJsonAsT<T>(baseJson);
            return APIResult.success(
              "",
              responseModel,
            );
          } else {
            return APIResult.success("", null);
          }
        } catch (e, s) {
          //FirebaseCrashlytics.instance.recordError(e, s);
          return APIResult.failure(e.toString());
        }
      }
  }
}
