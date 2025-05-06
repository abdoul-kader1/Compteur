import 'package:compteur/features/meteo/domain/usecases/get_meteo.dart';
import 'package:compteur/features/meteo/presenter/cubit/meteo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'meteo_event.dart';
part 'meteo_state.dart';

class MeteoBloc extends Bloc<MeteoEvent, MeteoState> {
   final GetMeteo meteoUseCase;
   final MeteoCubit meteoCubit;
  MeteoBloc(this.meteoUseCase,this.meteoCubit) : super(MeteoInitial()) {
    on<GetMeteoEvent>(_getMeteoVilleOrCommune);
  }
  void _getMeteoVilleOrCommune(GetMeteoEvent event, Emitter<MeteoState> emit)async{
    emit(MeteoLoading());
    final reponse = await meteoUseCase.getMeteoVilleOrCommune(event.query.trim());
    reponse.fold((l){
      emit(MeteoEchec(l));
    }, (r){
      emit(MeteoInitial());
      meteoCubit.changeMeteo(r);
    });
  }
}
