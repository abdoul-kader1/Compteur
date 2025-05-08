import 'package:compteur/core/utils/api/key.dart';
import 'package:compteur/core/utils/api/requetes.dart';
import 'package:compteur/features/meteo/data/models/prevision_meteo_m.dart';
import 'package:compteur/features/meteo/domain/entities/prevision_meteo_e.dart';

class MeteoRemote{

  Future<PrevisionMeteo>getMeteoVilleOrCommune(String query)async{
    try{
      final reponse = await CompteurRequetes.read(urlApi: "https://api.openweathermap.org/data/2.5/forecast?q=$query&appid=${CompteurKey.weeather}&lang=fr&units=metric&cnt=10", endPoint: "");
     return PrevisionMeteoModel.fromMap(reponse);
    }catch(e){
      rethrow;
    }
  }
}