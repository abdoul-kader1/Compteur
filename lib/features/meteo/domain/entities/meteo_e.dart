import 'package:compteur/features/meteo/domain/entities/main_e.dart';
import 'package:compteur/features/meteo/domain/entities/weather_e.dart';
import 'package:compteur/features/meteo/domain/entities/wind_e.dart';

class Meteo {
  List<Weather> weather;
  Main main;
  Wind wind;
  DateTime dt;
  Meteo({
    required this.weather,
    required this.main,
    required this.wind,
    required this.dt,
  });
}

