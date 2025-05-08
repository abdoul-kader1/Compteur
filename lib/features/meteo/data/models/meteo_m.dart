import 'package:compteur/features/meteo/data/models/main_m.dart';
import 'package:compteur/features/meteo/data/models/weather_m.dart';
import 'package:compteur/features/meteo/data/models/wind_m.dart';
import 'package:compteur/features/meteo/domain/entities/meteo_e.dart';

class MeteoModel extends Meteo{

  MeteoModel({required super.weather, required super.main, required super.wind,required super.dt});

  factory MeteoModel.fromMap(Map<String, dynamic> map) {
    return MeteoModel(
      weather: (map['weather'] as List).map((data)=>WeatherModel.fromMap(data)).toList(),
      main: MainModel.fromMap(map['main']),
      wind: WindModel.fromMap(map['wind']),
      dt: DateTime.fromMillisecondsSinceEpoch(map['dt']*1000,isUtc: true)
    );
  }
}