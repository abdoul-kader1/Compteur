import 'package:compteur/features/meteo/domain/entities/meteo_e.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'meteo_state.dart';

class MeteoCubit extends Cubit<MeteoStateCubit> {

  MeteoCubit() : super(MeteoInitialCubit());

  changeMeteo(Meteo meteo){
    emit(MeteoInitialCubit(meteo));
  }
}
