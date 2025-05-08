import 'package:compteur/features/meteo/data/models/city_m.dart';
import 'package:compteur/features/meteo/data/models/meteo_m.dart';
import 'package:compteur/features/meteo/domain/entities/prevision_meteo_e.dart';

class PrevisionMeteoModel extends PrevisionMeteo{

  PrevisionMeteoModel({required super.city, required super.meteos});


  factory PrevisionMeteoModel.fromMap(Map<String, dynamic> map) {
    return PrevisionMeteoModel(
      city: CityModel.fromMap(map['city']),
      meteos: (map['list'] as List).map((data)=>MeteoModel.fromMap(data)).toList(),
    );
  }

}