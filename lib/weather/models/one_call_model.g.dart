// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneCall _$OneCallFromJson(Map<String, dynamic> json) => OneCall(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      daily: (json['daily'] as List<dynamic>)
          .map((e) => Daily.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OneCallToJson(OneCall instance) => <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'daily': instance.daily,
    };
