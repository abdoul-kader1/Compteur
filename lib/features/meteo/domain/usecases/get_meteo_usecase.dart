import 'package:compteur/features/meteo/domain/entities/prevision_meteo_e.dart';
import 'package:compteur/features/meteo/domain/repositorys/meteo_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetMeteoUseCase{

  final MeteoRepository meteoRepository;

  GetMeteoUseCase(this.meteoRepository);

  Future<Either<String,PrevisionMeteo>>getMeteoVilleOrCommune(String query)async{
   return await meteoRepository.getMeteoVilleOrCommune(query);
  }

}