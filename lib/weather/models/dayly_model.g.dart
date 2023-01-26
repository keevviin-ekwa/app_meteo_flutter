// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dayly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      dt: json['dt'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
      moonrise: json['moonrise'] as int,
      moonset: json['moonset'] as int,
      moonPhase: (json['moon_phase'] as num).toDouble(),
      temp: TempModel.fromJson(json['temp'] as Map<String, dynamic>),
      weather: Weather.fromJson(json['weather'][0] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moonPhase,
      'temp': instance.temp,
      'weather': instance.weather,
    };
