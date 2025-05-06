import 'package:compteur/features/meteo/domain/entities/meteo_e.dart';
import 'package:compteur/features/meteo/domain/repositorys/meteo_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetMeteo{

  final MeteoRepository meteoRepository;

  GetMeteo(this.meteoRepository);

  Future<Either<String, Meteo>>getMeteoVilleOrCommune(String query)async{
   return await meteoRepository.getMeteoVilleOrCommune(query);
  }

}