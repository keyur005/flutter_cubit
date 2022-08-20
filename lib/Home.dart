import 'package:cubit_bloc_demo/core/constants/color_const.dart';
import 'package:cubit_bloc_demo/core/cubit/weather_cubit.dart';
import 'package:cubit_bloc_demo/core/model/weather_list_model.dart';
import 'package:cubit_bloc_demo/core/model/weather_response_model_entity.dart';
import 'package:cubit_bloc_demo/core/network/api_result.dart';
import 'package:cubit_bloc_demo/core/utils/enum.dart';
import 'package:cubit_bloc_demo/core/utils/show_snakbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<HomeScreen> {
  final GetWeatherCubit _getWeatherCubit = GetWeatherCubit();

  List<City> cityList = [];
  City? selectedWeatherItem;
  WeatherResponseModelEntity? model;

  @override
  void initState() {
    super.initState();

    cityList.add(City(
        id: 1, city: "Kuala Lumpur", latitude: "3.13", longitude: "101.68"));
    cityList.add(City(
        id: 2, city: "Kabul", latitude: "34.5166667", longitude: "69.1833344"));
    cityList.add(City(
        id: 3,
        city: "New York City",
        latitude: "40.7142691",
        longitude: "-74.0059738"));
    cityList.add(City(
        id: 4,
        city: "Columbus",
        latitude: "39.9611755",
        longitude: "-82.9987946"));
    cityList.add(City(
        id: 5,
        city: "San Francisco",
        latitude: "-31.4333333",
        longitude: "-62.0833321"));
    cityList.add(City(
        id: 6, city: "Wien", latitude: "48.2084878", longitude: "16.3720760"));
    cityList.add(City(
        id: 7, city: "Dhaka", latitude: "23.7230556", longitude: "90.4086075"));
    cityList.add(City(
        id: 8,
        city: "Rio de Janeiro",
        latitude: "-22.9027778",
        longitude: "-43.2075005"));
    cityList.add(City(
        id: 9,
        city: "London",
        latitude: "51.5084153",
        longitude: "-0.1255327"));
    cityList.add(City(
        id: 10,
        city: "Toronto",
        latitude: "43.7001138",
        longitude: "-79.4163055"));
    cityList.add(City(
        id: 11,
        city: "Shanghai",
        latitude: "31.2222222",
        longitude: "121.4580536"));
    cityList.add(City(
        id: 12,
        city: "Amsterdam",
        latitude: "52.3730840",
        longitude: "4.8999023"));
    cityList.add(City(
        id: 23,
        city: "Boston",
        latitude: "42.3584308",
        longitude: "-71.0597763"));

    _callGetWeatherAPI(cityList[0]);
  }

  void _callGetWeatherAPI(City item) {
    _getWeatherCubit.callGetWeatherAPI(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.whiteColor,
        appBar: AppBar(
          title: const Text("Weather App"),
        ),
        body: BlocProvider.value(value: _getWeatherCubit, child: homeBody()));
  }

  Widget homeBody() {
    return BlocListener<GetWeatherCubit,
            APIResult<WeatherResponseModelEntity>?>(
        listener: (ctx, state) {
          if (state != null) {
            if (state.apiResultType == APIResultType.NO_INTERNET) {
              showSnackBar(context, state.message!);
            } else if (state.apiResultType == APIResultType.FAILURE) {
              showSnackBar(context, state.message!);
            } else if (state.apiResultType == APIResultType.SUCCESS) {
              if (state.result != null) {
                setState(() {
                  model = state.result!;
                });
              }
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 42,
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                  isDense: true,
                  items: cityList.map((item) {
                    return DropdownMenuItem<City>(
                      child: Text(item.city),
                      value: item,
                    );
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      selectedWeatherItem = newVal as City?;
                      _callGetWeatherAPI(selectedWeatherItem!);
                      //getCityData(newVal);
                    });
                  },
                  hint: Text('Select State'),
                  value: selectedWeatherItem ?? cityList.first,
                  isExpanded: true,
                )),
                padding: EdgeInsets.fromLTRB(14, 10, 10, 10),
                // padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(style: BorderStyle.solid, width: 0.80),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              weatherDetails()
            ],
          ),
        ));
  }

  Widget weatherDetails() {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: ColorConst.dialogRedColor),
          borderRadius: BorderRadius.all(const Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "Lat: ${model?.coord!.lat.toString() ?? ""}",
            style: TextStyle(color: ColorConst.blackColor, fontSize: 25),
          ),
          Text(
            "Long: ${model?.coord!.lon.toString() ?? ""}",
            style: TextStyle(color: ColorConst.blackColor, fontSize: 25),
          ),
          Text(
            model?.weather![0].main ?? "",
            style: TextStyle(color: ColorConst.blackColor, fontSize: 25),
          ),
          Text(
            model?.weather![0].id.toString() ?? "",
            style: TextStyle(color: ColorConst.blackColor, fontSize: 25),
          ),
          Text(
            model?.weather![0].description ?? "",
            style: TextStyle(color: ColorConst.blackColor, fontSize: 25),
          ),
          Text(
            "Wind speed: ${model?.wind?.speed.toString() ?? ""}",
            style: TextStyle(color: ColorConst.blackColor, fontSize: 25),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "City: ${model?.name ?? ""}",
            style: TextStyle(color: ColorConst.blackColor, fontSize: 25),
          ),
          Text(
            "Temp min: ${model?.main!.tempMin ?? ""}",
            style: TextStyle(color: ColorConst.blackColor, fontSize: 25),
          ),
          Text(
            "Temp max: ${model?.main!.tempMax ?? ""}",
            style: TextStyle(color: ColorConst.blackColor, fontSize: 25),
          ),
          Text(
            "Pressure: ${model?.main!.pressure ?? ""}",
            style: TextStyle(color: ColorConst.blackColor, fontSize: 25),
          )
        ],
      ),
    );
  }
}
