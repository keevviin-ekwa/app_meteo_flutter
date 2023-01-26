// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoModel _$GeoModelFromJson(Map<String, dynamic> json) => GeoModel(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$GeoModelToJson(GeoModel instance) => <String, dynamic>{
      'long': instance.lon,
      'lat': instance.lat,
    };
