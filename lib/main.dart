import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/weather_app.dart';




Future <void> main() async{
  SystemChrome.setSystemUIOverlayStyle(
   const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await dotenv.load(fileName: '.env');
  runApp(
    const WeatherApp()
  );
}


