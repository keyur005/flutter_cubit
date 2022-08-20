import 'dart:convert';
import 'package:cubit_bloc_demo/generated/json/base/json_field.dart';
import 'package:cubit_bloc_demo/generated/json/weather_response_model_entity.g.dart';

@JsonSerializable()
class WeatherResponseModelEntity {

	WeatherResponseModelCoord? coord;
	List<WeatherResponseModelWeather>? weather;
	String? base;
	WeatherResponseModelMain? main;
	int? visibility;
	WeatherResponseModelWind? wind;
	WeatherResponseModelRain? rain;
	WeatherResponseModelClouds? clouds;
	int? dt;
	WeatherResponseModelSys? sys;
	int? timezone;
	int? id;
	String? name;
	int? cod;
  
  WeatherResponseModelEntity();

  factory WeatherResponseModelEntity.fromJson(Map<String, dynamic> json) => $WeatherResponseModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $WeatherResponseModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherResponseModelCoord {

	double? lon;
	double? lat;
  
  WeatherResponseModelCoord();

  factory WeatherResponseModelCoord.fromJson(Map<String, dynamic> json) => $WeatherResponseModelCoordFromJson(json);

  Map<String, dynamic> toJson() => $WeatherResponseModelCoordToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherResponseModelWeather {

	int? id;
	String? main;
	String? description;
	String? icon;
  
  WeatherResponseModelWeather();

  factory WeatherResponseModelWeather.fromJson(Map<String, dynamic> json) => $WeatherResponseModelWeatherFromJson(json);

  Map<String, dynamic> toJson() => $WeatherResponseModelWeatherToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherResponseModelMain {

	double? temp;
	@JSONField(name: "feels_like")
	double? feelsLike;
	@JSONField(name: "temp_min")
	double? tempMin;
	@JSONField(name: "temp_max")
	double? tempMax;
	int? pressure;
	int? humidity;
	@JSONField(name: "sea_level")
	int? seaLevel;
	@JSONField(name: "grnd_level")
	int? grndLevel;
  
  WeatherResponseModelMain();

  factory WeatherResponseModelMain.fromJson(Map<String, dynamic> json) => $WeatherResponseModelMainFromJson(json);

  Map<String, dynamic> toJson() => $WeatherResponseModelMainToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherResponseModelWind {

	double? speed;
	int? deg;
	double? gust;
  
  WeatherResponseModelWind();

  factory WeatherResponseModelWind.fromJson(Map<String, dynamic> json) => $WeatherResponseModelWindFromJson(json);

  Map<String, dynamic> toJson() => $WeatherResponseModelWindToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherResponseModelRain {

	@JSONField(name: "1h")
	double? x1h;
  
  WeatherResponseModelRain();

  factory WeatherResponseModelRain.fromJson(Map<String, dynamic> json) => $WeatherResponseModelRainFromJson(json);

  Map<String, dynamic> toJson() => $WeatherResponseModelRainToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherResponseModelClouds {

	int? all;
  
  WeatherResponseModelClouds();

  factory WeatherResponseModelClouds.fromJson(Map<String, dynamic> json) => $WeatherResponseModelCloudsFromJson(json);

  Map<String, dynamic> toJson() => $WeatherResponseModelCloudsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherResponseModelSys {

	String? country;
	int? sunrise;
	int? sunset;
  
  WeatherResponseModelSys();

  factory WeatherResponseModelSys.fromJson(Map<String, dynamic> json) => $WeatherResponseModelSysFromJson(json);

  Map<String, dynamic> toJson() => $WeatherResponseModelSysToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}