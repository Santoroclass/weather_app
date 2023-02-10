import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/provider/weather_provider.dart';
import 'package:weather_app/ui/ui_theme/app_colors.dart';


class SevenDaysWeatherWidget extends StatelessWidget {
  const SevenDaysWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.sevenDayBoxColor,
      ),
    );
  }
}


