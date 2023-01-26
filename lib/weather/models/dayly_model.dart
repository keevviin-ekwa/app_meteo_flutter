import 'package:meteo_app/weather/models/climat_model.dart';
import 'package:meteo_app/weather/models/temp_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'dayly_model.g.dart';

@JsonSerializable()
class Daily {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  @JsonKey(name:"moon_phase")
  final double moonPhase;
  final TempModel temp;
  final Weather weather;

   Daily({required this.dt,required this.sunrise,required this.sunset,required this.moonrise,required this.moonset,required this.moonPhase,required this.temp,required this.weather});
  

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson (json);

 

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}
