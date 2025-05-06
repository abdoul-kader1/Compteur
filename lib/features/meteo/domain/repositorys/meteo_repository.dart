import 'package:compteur/features/meteo/domain/entities/meteo_e.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class MeteoRepository{

  Future<Either<String,Meteo>>getMeteoVilleOrCommune(String query);

}