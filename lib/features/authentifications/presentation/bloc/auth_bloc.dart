import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<ConnexionClient>(_connexion);
  }
  void _connexion(ConnexionClient event,Emitter<AuthState> emit)async{
    String email = event.email;
    String mdp = event.mdp;
    if(event.keyform.currentState!.validate()){
      if(mdp.length>6){
        if(event.checkBox){
          emit(AuthLoading());
          await Future.delayed(const Duration(seconds: 2));
          emit(AuthSucces("$email $mdp"));
        }else{
          return emit(AuthEchec("la case a cocher est obligatoire maintenant"));
        }
      }else{
        emit(AuthEchec("au moins 6 caracteres pour le mdp"));
      }
    }
  }
}