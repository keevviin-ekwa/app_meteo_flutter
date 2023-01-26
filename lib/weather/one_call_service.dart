import 'package:dio/dio.dart';
import 'package:meteo_app/app/config.dart';
import 'package:meteo_app/weather/models/one_call_model.dart';
import 'package:meteo_app/weather/models/weather_model.dart';

class OneCallService {
  late Dio _dio;
  final double lat;
  final double lon;

  OneCallService({this.lat = 4.0483, this.lon = 9.7043}) {
    _dio = Dio(BaseOptions(baseUrl: Config.apiUrl, queryParameters: {
      "units": "metric",
      "lat": lat,
      "lon": lon,
      "appid": Config.apiKey,
    }));
  }

  Future<OneCall> getOnCallWeather() async {
    Response resp = await _dio.get('/onecall');
    dynamic data = OneCall.fromJson(resp.data);
    return OneCall.fromJson(resp.data);
  }
}
