import 'package:dio/dio.dart';
import 'package:meteo_app/app/config.dart';
import 'package:meteo_app/weather/models/weather_model.dart';

class WeatherService {
  late Dio _dio;

  final String location;
  WeatherService({this.location = "Douala"}) {
    _dio = Dio(BaseOptions(baseUrl: Config.apiUrl, queryParameters: {
      "q": location,
      "units": "metric",
      "appid": Config.apiKey,
    }));
  }

  Future<WeatherModel> getCurrentWeather() async {
    Response resp = 
    await _dio.get('/weather');
    //dynamic  data= WeatherModel.fromJson(resp.data);
    return WeatherModel.fromJson(resp.data);
  }
}
