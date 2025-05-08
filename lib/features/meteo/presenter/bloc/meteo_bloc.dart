import 'package:compteur/features/meteo/domain/usecases/get_meteo_usecase.dart';
import 'package:compteur/features/meteo/presenter/cubit/meteo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'meteo_event.dart';
part 'meteo_state.dart';

class MeteoBloc extends Bloc<MeteoEvent, MeteoState> {
   final GetMeteoUseCase _meteoUseCase;
   final MeteoCubit _meteoCubit;
  MeteoBloc(GetMeteoUseCase meteoUseCase,MeteoCubit meteoCubit) :_meteoUseCase=meteoUseCase,_meteoCubit=meteoCubit, super(MeteoInitial()) {
    on<GetMeteoEvent>(_getMeteoVilleOrCommune);
  }
  void _getMeteoVilleOrCommune(GetMeteoEvent event, Emitter<MeteoState> emit)async{
    emit(MeteoLoading());
    final reponse = await _meteoUseCase.getMeteoVilleOrCommune(event.query.trim());
    reponse.fold((l){
      emit(MeteoEchec(l));
     _meteoCubit.initialisationMeteo();
    }, (r){
      emit(MeteoInitial());
      _meteoCubit.changeMeteo(r);
    });
  }
}
