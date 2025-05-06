import 'package:compteur/features/meteo/domain/entities/weather_e.dart';

class WeatherModel extends Weather{

  WeatherModel({required super.id, required super.main, required super.description, required super.icon});

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      id: map['id'] as int,
      main: map['main'] as String,
      description: map['description'] as String,
      icon: map['icon'] as String,
    );
  }
}