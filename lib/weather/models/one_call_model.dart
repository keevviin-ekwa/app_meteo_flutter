import 'package:json_annotation/json_annotation.dart';
import 'package:meteo_app/weather/models/dayly_model.dart';

part 'one_call_model.g.dart';

@JsonSerializable()
class OneCall {
  final double lat;
  final double lon;
  final List<Daily> daily;

  OneCall({required this.lat, required this.lon,required this.daily});


   factory OneCall.fromJson(Map<String, dynamic> json) => _$OneCallFromJson (json);
  Map<String, dynamic> toJson() => _$OneCallToJson(this);

}
