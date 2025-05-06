import 'package:compteur/core/utils/api/key.dart';
import 'package:compteur/core/utils/api/requetes.dart';
import 'package:compteur/features/meteo/data/models/meteo_m.dart';

class MeteoRemote{

  Future<MeteoModel>getMeteoVilleOrCommune(String query)async{
    try{
      final reponse = await CompteurRequetes.read(urlApi: "https://api.openweathermap.org/data/2.5/weather?q=$query&appid=${CompteurKey.weeather}&lang=fr&units=metric", endPoint: "");
     return MeteoModel.fromMap(reponse);
    }catch(e){
      rethrow;
    }
  }
}