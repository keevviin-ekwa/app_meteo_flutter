import 'package:flutter/material.dart';
import 'package:meteo_app/app/views/anitialization_page.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApplicationInialize(),
    );
  }
}
