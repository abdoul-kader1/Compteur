import 'package:compteur/features/meteo/domain/entities/prevision_meteo_e.dart';
import 'package:compteur/features/meteo/domain/repositorys/meteo_repository.dart';
import 'package:fpdart/fpdart.dart';
import '../datasources/meteo_remote.dart';

class MeteoRepositorieImpl implements MeteoRepository{

  final MeteoRemote meteoRemote;

  MeteoRepositorieImpl( this.meteoRemote);

  @override
  Future<Either<String,PrevisionMeteo>> getMeteoVilleOrCommune(String query)async{
    try{
      final reponse = await meteoRemote.getMeteoVilleOrCommune(query);
      return Right(reponse);
    }catch(e){
      return Left(e.toString());
    }
  }}