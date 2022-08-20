import 'dart:async';
import 'package:cubit_bloc_demo/core/model/weather_list_model.dart';
import 'package:cubit_bloc_demo/core/model/weather_response_model_entity.dart';
import 'package:cubit_bloc_demo/core/network/api_helper.dart';
import 'package:cubit_bloc_demo/core/network/api_response_handler.dart';
import 'package:cubit_bloc_demo/core/network/api_result.dart';
import 'package:cubit_bloc_demo/core/network/api_url.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/logger_util.dart';





class GetWeatherCubit extends Cubit<APIResult<WeatherResponseModelEntity>?> {
  GetWeatherCubit() : super(null);

  Future<void> callGetWeatherAPI(City item ) async {
    emit(APIResult.loading());
    logger.d("Newtwork URL::: ${NetworkConstant.baseUrl+"?lat=${item.latitude}&lon=${item.longitude}&appid="+NetworkConstant.appId}");
    var baseParameters = {};
    var networkResult = await APIHelper.instance.callPostApi(NetworkConstant.baseUrl+"?lat=${item.latitude}&lon=${item.longitude}&appid="+NetworkConstant.appId, baseParameters, true);

    var apiResultFromNetwork = getAPIResultFromNetwork<WeatherResponseModelEntity>(networkResult);
    emit(apiResultFromNetwork);
  }
}
