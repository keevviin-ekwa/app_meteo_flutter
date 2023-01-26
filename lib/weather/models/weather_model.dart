import 'package:json_annotation/json_annotation.dart';
import 'package:meteo_app/weather/models/climat_model.dart';
import 'package:meteo_app/weather/models/geo_model.dart';
import 'package:meteo_app/weather/models/main_model.dart';
import 'package:meteo_app/weather/models/wind_model.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final int id;
  final String name;
  final int timezone;
  final MainModel main;
  final WindModel wind;

  final Weather weather;
  final GeoModel coord;

  WeatherModel(
      {required this.id,
      // required this.weather,
      required this.name,
      required this.timezone,
      required this.main,
      required this.wind,
      required this.weather,
      required this.coord});

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
