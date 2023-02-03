import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/provider/weather_provider.dart';
import 'package:weather_app/ui/components/current_weather_status/current_weather_status.dart';
import 'package:weather_app/ui/components/weather_appbar.dart';
import 'package:weather_app/ui/ui_theme/app_colors.dart';
import 'package:weather_app/ui/ui_theme/app_style.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:FutureBuilder(
        future: Provider.of<WeatherProvider>(context).setUp(),
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return const HomePageWidget();
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      
    );
  }
}


class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WeatherProvider>(context);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/shiny_day.png'),
          fit: BoxFit.cover,
            ),
      
      ),
      child: Column(
        children:  [
         const WeatherAppBar(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              children: [
                Text(model.setCurrentTime(), 
                textAlign: TextAlign.center,
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 14, 
                  color: AppColors.darkBlueColor,
                  
                  ),
                ),
                const SizedBox(height: 36,),
                const CurrentWeatherStatus(),
              ],
            ),),
        ],
        ),
    );
  }
}