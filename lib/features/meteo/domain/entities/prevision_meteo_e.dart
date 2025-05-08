import 'package:compteur/features/meteo/domain/entities/meteo_e.dart';
import 'city_e.dart';

class PrevisionMeteo{
  City city;
  List<Meteo>meteos;

  PrevisionMeteo({
    required this.city,
    required this.meteos,
  });
}