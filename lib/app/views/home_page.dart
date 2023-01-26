import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meteo_app/app/widgets/bottom_nav.dart';
import 'package:meteo_app/app/widgets/weather_tile.dart';
import 'package:meteo_app/weather/models/one_call_model.dart';
import 'package:meteo_app/weather/models/weather_model.dart';
import 'package:meteo_app/weather/one_call_service.dart';
import 'package:meteo_app/weather/weather_service.dart';

class HomePage extends StatefulWidget {
  Future<WeatherModel>? future;
  HomePage({this.future, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherService _weatherService;
  late OneCallService _oneCallService;
  late Future<WeatherModel> _weatherFuture;
  late Future<OneCall> _onCallFutre;

  int menuSelected = 0;
  String name = "Douala";

  @override
  void initState() {
    _weatherService = WeatherService();
    //_oneCallService = OneCallService();
    _weatherFuture = _weatherService.getCurrentWeather();
    // _onCallFutre = _oneCallService.getOnCallWeather();
    // TODO: implement initState
    super.initState();

    widget.future?.then((value) => () {
          name = value.name;
          print(name);
        });
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
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: const Color(0XFF0C093C),
            body: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150, //MediaQuery.of(context).size.height * .2,
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              name,
                              style: GoogleFonts.lilitaOne(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("07 Mars 2021",
                                style: GoogleFonts.lilitaOne(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white)),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10)),
                                  //height: 30,
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: TabBar(
                                      //unselectedLabelColor: Color(0xFF0C093C),
                                      indicator: ShapeDecoration(
                                          color: Colors.blue,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      tabs: const [
                                        Tab(
                                          text: "Prévision",
                                        ),
                                        Tab(
                                          text: "Qualité d'air",
                                        )
                                      ]),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(children: [
                  FutureBuilder<WeatherModel>(
                      future: widget.future ?? _weatherFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.active ||
                            snapshot.connectionState ==
                                ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                "ERREUR",
                                style: GoogleFonts.lilitaOne(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          } else {
                            var data = snapshot.data!;
                            var lat = data.coord.lat;
                            var lon = data.coord.lon;

                            //prevision sur une semaine.
                            _oneCallService =
                                OneCallService(lat: lat, lon: lon);
                            _onCallFutre = _oneCallService.getOnCallWeather();

                            String image = checkTime(data.weather.main);
                            return SingleChildScrollView(
                                child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.scaleDown,
                                          image: AssetImage(image))),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text("Temp",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                          Text(
                                              data.main.temp.toString() + ' °C',
                                              style: GoogleFonts.lilitaOne(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Vent",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          Text("${data.wind.speed} km/h",
                                              style: GoogleFonts.lilitaOne(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const Text("Humidité",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                          Text("${data.main.humidity} %",
                                              style: GoogleFonts.lilitaOne(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Aujourd'hui",
                                          style: GoogleFonts.lilitaOne(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text("Voir le rapport complet",
                                          style: GoogleFonts.lilitaOne(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    height: 100,
                                    // width: MediaQuery.of(context).size.width,
                                    child: FutureBuilder<OneCall>(
                                        future: _onCallFutre,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                                  ConnectionState.active ||
                                              snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            if (snapshot.hasError) {
                                              return Center(
                                                child: Text(
                                                  "Erreur",
                                                  style: GoogleFonts.lilitaOne(
                                                      color: Colors.white),
                                                ),
                                              );
                                            } else if (!snapshot.hasData) {
                                              return Center(
                                                child: Text(
                                                  "Pas de données",
                                                  style: GoogleFonts.lilitaOne(
                                                      color: Colors.white),
                                                ),
                                              );
                                            } else {
                                              var datas = snapshot.data?.daily;

                                              return ListView.builder(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: datas?.length,
                                                  itemBuilder: (context,
                                                          index) =>
                                                      WeatherTile(
                                                        daily: datas![index],
                                                      ));
                                            }
                                            if (snapshot.hasData) {
                                              setState(() {
                                                name = data.name;
                                              });
                                            }
                                          }
                                          return Container();
                                        }))
                              ],
                            ));
                          }
                        }
                        return Container();
                      }),
                  Container()
                ]))
              ],
            ),
            bottomNavigationBar: BottomNav(menuSelected: menuSelected)),
      ),
    );
  }
}
