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
String setBg(){
    int id = current?.weather?[0].id ?? -1;
    
    if (id == -1  current?.sunset == null  current?.dt == null) {
      currentBg = AppBg.shinyDay;
    }
    
   try {
     if (current!.sunset! < current!.dt!) {
       if (id >= 200 && id <= 531) {
         currentBg = AppBg.rainyNight;
       }
       else if(id >= 600 && id <= 622){
        currentBg = AppBg.snowNight;
       }
       else if(id >= 701 && id <= 781){
        currentBg = AppBg.fogNight;
       }
       
       else if(id == 800){
        currentBg = AppBg.shinyNight;
       }
       else if (id >= 801 && id <=  804){
        currentBg = AppBg.cloudyNight;
       }
     }
     
     try {
     if (current!.sunset! < current!.dt!) {
       if (id >= 200 && id <= 531) {
         currentBg = AppBg.rainyNight;
       }
       else if(id >= 600 && id <= 622){
        currentBg = AppBg.snowNight;
       }
       else if(id >= 701 && id <= 781){
        currentBg = AppBg.fogNight;
       }
       
       else if(id == 800){
        currentBg = AppBg.shinyNight;
       }
       else if (id >= 801 && id <=  804){
        currentBg = AppBg.cloudyNight;
       }
     }try {
     if (current!.sunset! < current!.dt!) {
       if (id >= 200 && id <= 531) {
         currentBg = AppBg.rainyNight;
       }
       else if(id >= 600 && id <= 622){
        currentBg = AppBg.snowNight;
       }
       else if(id >= 701 && id <= 781){
        currentBg = AppBg.fogNight;
       }
       
       else if(id == 800){
        currentBg = AppBg.shinyNight;
       }
       else if (id >= 801 && id <=  804){
        currentBg = AppBg.cloudyNight;
       }
     }
   } catch (e) {
     return AppBg.shinyDay;
   }
    
    return currentBg ?? AppBg.shinyDay;
  }