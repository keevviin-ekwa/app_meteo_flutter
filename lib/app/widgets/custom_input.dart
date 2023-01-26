import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meteo_app/app/views/home_page.dart';
import 'package:meteo_app/weather/models/weather_model.dart';
import 'package:meteo_app/weather/weather_service.dart';

class CustomInput extends StatefulWidget {
  CustomInput({Key? key}) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late TextEditingController _textEditingController;
  late WeatherService _weatherService;
  late Future<WeatherModel> _weatherFuture;

  bool _isEditing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _weatherService = WeatherService();

    _weatherFuture = _weatherService.getCurrentWeather();

    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                contentPadding: const EdgeInsets.all(5),
                hintText: "Douala...",
                prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
            )),
        InkWell(
          onTap: () {
            if (_textEditingController.text.isNotEmpty) {
              String location = _textEditingController.text;
              _weatherService = WeatherService(location: location);
              _weatherFuture = _weatherService.getCurrentWeather();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePage(
                        future: _weatherFuture,
                      )));
            }
          },
          child: Container(
            height: 50,
            width: 50,
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.mapMarker,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
