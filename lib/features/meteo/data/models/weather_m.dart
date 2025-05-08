import 'package:compteur/features/meteo/domain/entities/weather_e.dart';

class WeatherModel extends Weather{

  WeatherModel({required super.id, required super.main, required super.description, required super.icon});

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      id: map['id'],
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }
}