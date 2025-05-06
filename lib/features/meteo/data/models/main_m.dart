import 'package:compteur/features/meteo/domain/entities/main_e.dart';

class MainModel extends Main{

  MainModel({required super.temp, required super.feelsLike, required super.tempMin, required super.tempMax, required super.pressure, required super.humidity, required super.seaLevel, required super.grndLevel});

  factory MainModel.fromMap(Map<String, dynamic> map) {
    return MainModel(
      temp: map['temp'] as double,
      feelsLike: map['feels_like'] as double,
      tempMin: map['temp_min'] as double,
      tempMax: map['temp_max'] as double,
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      seaLevel: map['sea_level'] as int,
      grndLevel: map['grnd_level'] as int,
    );
  }
}