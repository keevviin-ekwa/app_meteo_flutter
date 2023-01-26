import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meteo_app/app/views/home_page.dart';
import 'package:meteo_app/weather/models/weather_model.dart';
import 'package:meteo_app/weather/weather_service.dart';

class ApplicationInialize extends StatefulWidget {
  ApplicationInialize({Key? key}) : super(key: key);

  @override
  State<ApplicationInialize> createState() => _ApplicationInializeState();
}

class _ApplicationInializeState extends State<ApplicationInialize> {
 

  @override
  void initState() {
    // TODO: implement initState
    checkWeather();
    super.initState();
  }

  checkWeather() {
   
    //log(_weatherService.getCurrentWeather());
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
