import 'package:compteur/cubit/app/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthInitial()) {
    on<ConnexionClient>(_connexion);
  }

  void _connexion(ConnexionClient event,Emitter<AuthState> emit)async{
    String mdp = event.mdp;
    if(event.keyform.currentState!.validate()){
      if(mdp.length>6){
        emit(AuthLoading());
        await Future.delayed(const Duration(seconds: 2));
        if(event.checkBox){
          event.appCubit.changeUserIsConnect(true);
        }
        event.appCubit.changeUserName(event.email);
        emit(AuthSucces());
      }else{
        emit(AuthEchec("au moins 6 caracteres pour le mdp"));
      }
    }
  }
}