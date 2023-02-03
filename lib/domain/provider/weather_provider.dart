import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/api/api.dart';
import 'package:weather_app/domain/json_conventors/coord.dart';
import 'package:weather_app/domain/json_conventors/weather_data.dart';

class WeatherProvider extends ChangeNotifier {
  
  // хранение координат
  Coord? _coords;
  Coord? get coords => _coords; 
  
  // Хранение данных о погоде
  WeatherData? weatherData;
  
  //Хранение текуших данных погоде
  
  Current? current;
  
  // контроллер ввода 
  TextEditingController searchController = TextEditingController();
  
  
  // Главная функция которую запустим в FutureBuilder
  
  Future<WeatherData?> setUp({String? cityName}) async{
    _coords = await Api.getCoords(cityName: cityName?? 'Ташкент');
    weatherData = await Api.getWeather(coords);
    current = weatherData?.current;
    
    return weatherData;
       
  }
  
      
    // Получение текушего времени
  String ? currentTime;
    
    String setCurrentTime(){
      final getTime = (current?.dt ?? 0) + (weatherData?.timezoneOffset ?? 0);
      final setTime = DateTime.fromMillisecondsSinceEpoch(getTime * 1000);
      currentTime= DateFormat('HH:mm a').format(setTime);
      print(currentTime);
      
      return currentTime ?? 'Error';
    }
      
    //************************************************/
    
   
   
   
   
   
   
   // Получение текушего статуса погоды
   String currentStatus = '';
   
   String setCurrentStatus(){
    currentStatus = current?.weather?[0].description ?? 'Ошибка';
    return currentStatus;
   }
   
   // получение иконки по текуший погоде
   String currentIconUrl = 'https://api.openweathermap.org/img/w/';
   
   String setIcon(){
    return '$currentIconUrl${current?.weather?[0].icon}.png';
   }
   
   
  
  
}