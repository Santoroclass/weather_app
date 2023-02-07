class Coord {
  dynamic lon;
  dynamic lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['coord']['lon'] ?? 0;
    lat = json['coord']['lat'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
    import 'dart:convert';
import 'package:http/http.dart' as http;


class Posts{
  Posts({
    int? userId,
    int? id,
    String? title,
    String? body
  }){
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }

Posts.fromJson(dynamic json){
  _userId = json['userId'];
  _id = json['id'];
  _title = json['title'];
  _body = json['body'];
}

int ? _userId;
int ? _id;
String ? _title;
String ? _body;

 int? get userId => _userId;
 int? get id => _id;
 String? get title => _title;
 String? get body => _body;

 Map<String, dynamic> toJson(){
  final map = <String, dynamic>{};
  map['userId'] = _userId;
  map['id'] = _id;
  map['title'] = _title;
  map['body'] = _body;
  return map;
 }
}
  }
}

