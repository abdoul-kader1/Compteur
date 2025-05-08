import 'package:compteur/features/meteo/domain/entities/main_e.dart';

class MainModel extends Main{

  MainModel({required super.temp, required super.feelsLike, required super.tempMin, required super.tempMax, required super.pressure, required super.humidity, required super.seaLevel, required super.grndLevel});

  factory MainModel.fromMap(Map<String, dynamic> map) {
    return MainModel(
      temp: map['temp'],
      feelsLike: map['feels_like'],
      tempMin: map['temp_min'],
      tempMax: map['temp_max'],
      pressure: map['pressure'],
      humidity: map['humidity'],
      seaLevel: map['sea_level'],
      grndLevel: map['grnd_level'],
    );
  }
}