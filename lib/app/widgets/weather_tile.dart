import 'package:intl/intl.dart'; // for date format
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meteo_app/weather/models/dayly_model.dart';

class WeatherTile extends StatefulWidget {
  final Daily daily;
  WeatherTile({required this.daily, Key? key}) : super(key: key);

  @override
  State<WeatherTile> createState() => _WeatherTileState();
}

class _WeatherTileState extends State<WeatherTile> {
  late String date;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting('fr');
    date = DateFormat.yMMMMd('fr')
        .format(DateTime.fromMillisecondsSinceEpoch(widget.daily.dt * 1000));
  }

  String checkTime(String time) {
    if (time == "Clear") {
      return "assets/images/sun.png";
    } else if (time == "Clouds") {
      return "assets/images/suncloud.png";
    } else if (time == "Snow") {
      return "assets/images/suncloud.png";
    } else {
      return "assets/images/sun.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 100,
      width: 200,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                  height: 70,
                  width: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              checkTime(widget.daily.weather.main))))),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: GoogleFonts.lilitaOne(
                        color: Colors.white, fontSize: 15),
                  ),
                  Text("${widget.daily.temp.day} °C",
                      style: GoogleFonts.lilitaOne(
                          color: Colors.white, fontSize: 15))
                ],
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(15)),
    );
  }
}
