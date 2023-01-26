// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      id: json['id'] as int,
      name: json['name'] as String,
      timezone: json['timezone'] as int,
      main: MainModel.fromJson(json['main'] as Map<String, dynamic>),
      wind: WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      weather: Weather.fromJson(json['weather'][0] as Map<String, dynamic>),
      coord: GeoModel.fromJson(json['coord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'timezone': instance.timezone,
      'main': instance.main,
      'wind': instance.wind,
      'weather': instance.weather,
      'coord': instance.coord,
    };
