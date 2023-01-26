import 'package:json_annotation/json_annotation.dart';

part 'temp_model.g.dart';

@JsonSerializable()
class TempModel {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

    
  TempModel({required this.day,required this.min,required this.max,required this.night,required this.eve, required this.morn});
  
factory TempModel.fromJson(Map<String, dynamic> json) => _$TempModelFromJson (json);

  Map<String, dynamic> toJson() => _$TempModelToJson(this);
}
