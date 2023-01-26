import 'package:flutter/material.dart';
import 'package:meteo_app/app/config.dart';

Future bootStrap(Widget builder) async
{
  await Config.init();
  runApp(builder);

}