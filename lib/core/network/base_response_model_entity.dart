import 'dart:convert';
import 'package:cubit_bloc_demo/generated/json/base/json_field.dart';
import 'package:cubit_bloc_demo/generated/json/base_response_model_entity.g.dart';

@JsonSerializable()
class BaseResponseModelEntity {

	String? cod;
	String? message;
  dynamic weather;
  
  BaseResponseModelEntity();

  factory BaseResponseModelEntity.fromJson(Map<String, dynamic> json) => $BaseResponseModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $BaseResponseModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}