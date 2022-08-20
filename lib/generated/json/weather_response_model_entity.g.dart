import 'package:cubit_bloc_demo/generated/json/base/json_convert_content.dart';
import 'package:cubit_bloc_demo/core/model/weather_response_model_entity.dart';

WeatherResponseModelEntity $WeatherResponseModelEntityFromJson(Map<String, dynamic> json) {
	final WeatherResponseModelEntity weatherResponseModelEntity = WeatherResponseModelEntity();
	final WeatherResponseModelCoord? coord = jsonConvert.convert<WeatherResponseModelCoord>(json['coord']);
	if (coord != null) {
		weatherResponseModelEntity.coord = coord;
	}
	final List<WeatherResponseModelWeather>? weather = jsonConvert.convertListNotNull<WeatherResponseModelWeather>(json['weather']);
	if (weather != null) {
		weatherResponseModelEntity.weather = weather;
	}
	final String? base = jsonConvert.convert<String>(json['base']);
	if (base != null) {
		weatherResponseModelEntity.base = base;
	}
	final WeatherResponseModelMain? main = jsonConvert.convert<WeatherResponseModelMain>(json['main']);
	if (main != null) {
		weatherResponseModelEntity.main = main;
	}
	final int? visibility = jsonConvert.convert<int>(json['visibility']);
	if (visibility != null) {
		weatherResponseModelEntity.visibility = visibility;
	}
	final WeatherResponseModelWind? wind = jsonConvert.convert<WeatherResponseModelWind>(json['wind']);
	if (wind != null) {
		weatherResponseModelEntity.wind = wind;
	}
	final WeatherResponseModelRain? rain = jsonConvert.convert<WeatherResponseModelRain>(json['rain']);
	if (rain != null) {
		weatherResponseModelEntity.rain = rain;
	}
	final WeatherResponseModelClouds? clouds = jsonConvert.convert<WeatherResponseModelClouds>(json['clouds']);
	if (clouds != null) {
		weatherResponseModelEntity.clouds = clouds;
	}
	final int? dt = jsonConvert.convert<int>(json['dt']);
	if (dt != null) {
		weatherResponseModelEntity.dt = dt;
	}
	final WeatherResponseModelSys? sys = jsonConvert.convert<WeatherResponseModelSys>(json['sys']);
	if (sys != null) {
		weatherResponseModelEntity.sys = sys;
	}
	final int? timezone = jsonConvert.convert<int>(json['timezone']);
	if (timezone != null) {
		weatherResponseModelEntity.timezone = timezone;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		weatherResponseModelEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		weatherResponseModelEntity.name = name;
	}
	final int? cod = jsonConvert.convert<int>(json['cod']);
	if (cod != null) {
		weatherResponseModelEntity.cod = cod;
	}
	return weatherResponseModelEntity;
}

Map<String, dynamic> $WeatherResponseModelEntityToJson(WeatherResponseModelEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['coord'] = entity.coord?.toJson();
	data['weather'] =  entity.weather?.map((v) => v.toJson()).toList();
	data['base'] = entity.base;
	data['main'] = entity.main?.toJson();
	data['visibility'] = entity.visibility;
	data['wind'] = entity.wind?.toJson();
	data['rain'] = entity.rain?.toJson();
	data['clouds'] = entity.clouds?.toJson();
	data['dt'] = entity.dt;
	data['sys'] = entity.sys?.toJson();
	data['timezone'] = entity.timezone;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['cod'] = entity.cod;
	return data;
}

WeatherResponseModelCoord $WeatherResponseModelCoordFromJson(Map<String, dynamic> json) {
	final WeatherResponseModelCoord weatherResponseModelCoord = WeatherResponseModelCoord();
	final double? lon = jsonConvert.convert<double>(json['lon']);
	if (lon != null) {
		weatherResponseModelCoord.lon = lon;
	}
	final double? lat = jsonConvert.convert<double>(json['lat']);
	if (lat != null) {
		weatherResponseModelCoord.lat = lat;
	}
	return weatherResponseModelCoord;
}

Map<String, dynamic> $WeatherResponseModelCoordToJson(WeatherResponseModelCoord entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['lon'] = entity.lon;
	data['lat'] = entity.lat;
	return data;
}

WeatherResponseModelWeather $WeatherResponseModelWeatherFromJson(Map<String, dynamic> json) {
	final WeatherResponseModelWeather weatherResponseModelWeather = WeatherResponseModelWeather();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		weatherResponseModelWeather.id = id;
	}
	final String? main = jsonConvert.convert<String>(json['main']);
	if (main != null) {
		weatherResponseModelWeather.main = main;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		weatherResponseModelWeather.description = description;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		weatherResponseModelWeather.icon = icon;
	}
	return weatherResponseModelWeather;
}

Map<String, dynamic> $WeatherResponseModelWeatherToJson(WeatherResponseModelWeather entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['main'] = entity.main;
	data['description'] = entity.description;
	data['icon'] = entity.icon;
	return data;
}

WeatherResponseModelMain $WeatherResponseModelMainFromJson(Map<String, dynamic> json) {
	final WeatherResponseModelMain weatherResponseModelMain = WeatherResponseModelMain();
	final double? temp = jsonConvert.convert<double>(json['temp']);
	if (temp != null) {
		weatherResponseModelMain.temp = temp;
	}
	final double? feelsLike = jsonConvert.convert<double>(json['feels_like']);
	if (feelsLike != null) {
		weatherResponseModelMain.feelsLike = feelsLike;
	}
	final double? tempMin = jsonConvert.convert<double>(json['temp_min']);
	if (tempMin != null) {
		weatherResponseModelMain.tempMin = tempMin;
	}
	final double? tempMax = jsonConvert.convert<double>(json['temp_max']);
	if (tempMax != null) {
		weatherResponseModelMain.tempMax = tempMax;
	}
	final int? pressure = jsonConvert.convert<int>(json['pressure']);
	if (pressure != null) {
		weatherResponseModelMain.pressure = pressure;
	}
	final int? humidity = jsonConvert.convert<int>(json['humidity']);
	if (humidity != null) {
		weatherResponseModelMain.humidity = humidity;
	}
	final int? seaLevel = jsonConvert.convert<int>(json['sea_level']);
	if (seaLevel != null) {
		weatherResponseModelMain.seaLevel = seaLevel;
	}
	final int? grndLevel = jsonConvert.convert<int>(json['grnd_level']);
	if (grndLevel != null) {
		weatherResponseModelMain.grndLevel = grndLevel;
	}
	return weatherResponseModelMain;
}

Map<String, dynamic> $WeatherResponseModelMainToJson(WeatherResponseModelMain entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['temp'] = entity.temp;
	data['feels_like'] = entity.feelsLike;
	data['temp_min'] = entity.tempMin;
	data['temp_max'] = entity.tempMax;
	data['pressure'] = entity.pressure;
	data['humidity'] = entity.humidity;
	data['sea_level'] = entity.seaLevel;
	data['grnd_level'] = entity.grndLevel;
	return data;
}

WeatherResponseModelWind $WeatherResponseModelWindFromJson(Map<String, dynamic> json) {
	final WeatherResponseModelWind weatherResponseModelWind = WeatherResponseModelWind();
	final double? speed = jsonConvert.convert<double>(json['speed']);
	if (speed != null) {
		weatherResponseModelWind.speed = speed;
	}
	final int? deg = jsonConvert.convert<int>(json['deg']);
	if (deg != null) {
		weatherResponseModelWind.deg = deg;
	}
	final double? gust = jsonConvert.convert<double>(json['gust']);
	if (gust != null) {
		weatherResponseModelWind.gust = gust;
	}
	return weatherResponseModelWind;
}

Map<String, dynamic> $WeatherResponseModelWindToJson(WeatherResponseModelWind entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['speed'] = entity.speed;
	data['deg'] = entity.deg;
	data['gust'] = entity.gust;
	return data;
}

WeatherResponseModelRain $WeatherResponseModelRainFromJson(Map<String, dynamic> json) {
	final WeatherResponseModelRain weatherResponseModelRain = WeatherResponseModelRain();
	final double? x1h = jsonConvert.convert<double>(json['1h']);
	if (x1h != null) {
		weatherResponseModelRain.x1h = x1h;
	}
	return weatherResponseModelRain;
}

Map<String, dynamic> $WeatherResponseModelRainToJson(WeatherResponseModelRain entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['1h'] = entity.x1h;
	return data;
}

WeatherResponseModelClouds $WeatherResponseModelCloudsFromJson(Map<String, dynamic> json) {
	final WeatherResponseModelClouds weatherResponseModelClouds = WeatherResponseModelClouds();
	final int? all = jsonConvert.convert<int>(json['all']);
	if (all != null) {
		weatherResponseModelClouds.all = all;
	}
	return weatherResponseModelClouds;
}

Map<String, dynamic> $WeatherResponseModelCloudsToJson(WeatherResponseModelClouds entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['all'] = entity.all;
	return data;
}

WeatherResponseModelSys $WeatherResponseModelSysFromJson(Map<String, dynamic> json) {
	final WeatherResponseModelSys weatherResponseModelSys = WeatherResponseModelSys();
	final String? country = jsonConvert.convert<String>(json['country']);
	if (country != null) {
		weatherResponseModelSys.country = country;
	}
	final int? sunrise = jsonConvert.convert<int>(json['sunrise']);
	if (sunrise != null) {
		weatherResponseModelSys.sunrise = sunrise;
	}
	final int? sunset = jsonConvert.convert<int>(json['sunset']);
	if (sunset != null) {
		weatherResponseModelSys.sunset = sunset;
	}
	return weatherResponseModelSys;
}

Map<String, dynamic> $WeatherResponseModelSysToJson(WeatherResponseModelSys entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['country'] = entity.country;
	data['sunrise'] = entity.sunrise;
	data['sunset'] = entity.sunset;
	return data;
}