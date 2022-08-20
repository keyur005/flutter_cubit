import 'package:cubit_bloc_demo/generated/json/base/json_convert_content.dart';
import 'package:cubit_bloc_demo/core/network/base_response_model_entity.dart';

BaseResponseModelEntity $BaseResponseModelEntityFromJson(Map<String, dynamic> json) {
	final BaseResponseModelEntity baseResponseModelEntity = BaseResponseModelEntity();
	final String? cod = jsonConvert.convert<String>(json['cod']);
	if (cod != null) {
		baseResponseModelEntity.cod = cod;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		baseResponseModelEntity.message = message;
	}
	final dynamic? weather = jsonConvert.convert<dynamic>(json['weather']);
	if (weather != null) {
		baseResponseModelEntity.weather = weather;
	}
	return baseResponseModelEntity;
}

Map<String, dynamic> $BaseResponseModelEntityToJson(BaseResponseModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['cod'] = entity.cod;
	data['message'] = entity.message;
	data['weather'] = entity.weather;
	return data;
}