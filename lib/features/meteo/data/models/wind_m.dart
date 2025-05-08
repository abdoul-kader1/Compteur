import 'package:compteur/features/meteo/domain/entities/wind_e.dart';

class WindModel extends Wind{

  WindModel({required super.speed, required super.deg});

  factory WindModel.fromMap(Map<String, dynamic> map) {
    return WindModel(
      speed: map['speed'],
      deg: map['deg'],
    );
  }

}