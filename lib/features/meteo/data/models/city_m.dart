import 'package:compteur/features/meteo/domain/entities/city_e.dart';

class CityModel extends City{

  CityModel({required super.name, required super.surnrise, required super.sunset});

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'] as String,
      surnrise: DateTime.fromMillisecondsSinceEpoch(map['sunrise'] *1000,isUtc: true),
      sunset: DateTime.fromMillisecondsSinceEpoch(map['sunset']*1000,isUtc: true),
    );
  }
}