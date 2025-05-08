import 'package:compteur/features/meteo/domain/entities/prevision_meteo_e.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class MeteoRepository{

  Future<Either<String,PrevisionMeteo>>getMeteoVilleOrCommune(String query);

}