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
    import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:hometask/models/posts.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:JsonExample(),
    );
  }
}

class JsonExample extends StatefulWidget {
  const JsonExample({super.key});

  @override
  State<JsonExample> createState() => _JsonExampleState();
}

class _JsonExampleState extends State<JsonExample> {

    List<Posts> postsList = [];

    Future<List<Posts>> getPostApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
     for(Map i in data){
      postsList.add(Posts.fromJson(i));
     }
     return postsList;
    }
    else{
       return postsList;
    }
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
           appBar: AppBar(
            title: const Text('Api Class'),
            centerTitle: true,
           ),
           body: Column(
            children: [
              Expanded(

                child: FutureBuilder(
                  future: getPostApi(),
                  builder: (context, snapshot){
                  if(!snapshot.hasData){
                  return const Center(child:  Text('Loading ...'));
                  }else{
                     return ListView.builder(
                      itemCount: postsList.length,
                      itemBuilder: (context, index){
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('userId: '+postsList[index].userId.toString()),
                              Text('id: '+postsList[index].id.toString()),
                              Text('Title: '+postsList[index].title.toString()),
                              Text('Body: '+postsList[index].body.toString()),
                              
                            ],
                          ),
                        ),
                      );
                     });
                  }
                },
                ),
              ),
            ],
           ),
    );


  }
}
  }