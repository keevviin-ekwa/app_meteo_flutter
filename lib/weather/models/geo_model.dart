import 'package:json_annotation/json_annotation.dart';

part 'geo_model.g.dart';

@JsonSerializable()
class GeoModel {
  final double lon;
  final double lat;

  GeoModel({required this.lon, required this.lat});

  /// Connect the generated [_$GeoModelFromJson] function to the `fromJson`
  /// factory.
  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoModelToJson(this);
}
