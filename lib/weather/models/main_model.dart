import 'package:json_annotation/json_annotation.dart';

part 'main_model.g.dart';

@JsonSerializable()
class MainModel {
  final double temp;
  @JsonKey(name: "temp_min")
  final double tempMin;
  @JsonKey(name: "temp_max")
  final double tempMax;
  final double pressure;
  final double humidity;

  MainModel(
      {required this.temp,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity});

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainModelToJson(this);
}
