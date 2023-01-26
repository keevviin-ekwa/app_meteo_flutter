import 'package:json_annotation/json_annotation.dart';

part 'wind_model.g.dart';

@JsonSerializable()
class WindModel {
  final double speed;
  final double deg;

  WindModel({required this.speed, required this.deg});

  factory WindModel.fromJson(Map<String, dynamic> json) => _$WindModelFromJson (json);
  

  Map<String, dynamic> toJson() => _$WindModelToJson(this);

}
