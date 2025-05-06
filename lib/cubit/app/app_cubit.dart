import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit() : super(AppInitial());

  void initialisationApp()async{
    final getInstance = await SharedPreferences.getInstance();
    emit(AppInitial(userConnect:getInstance.getBool("userIsConnect")??false));
  }

  void changeUserIsConnect(bool valeur)async{
    final getInstance = await SharedPreferences.getInstance();
    await getInstance.setBool("userIsConnect",valeur);
  }

  void changeUserName(String valeur)async{
    final getInstance = await SharedPreferences.getInstance();
    await getInstance.setString("userName",valeur);
  }

  void getUserName()async{
    final getInstance = await SharedPreferences.getInstance();
    emit(AppInitial(userConnect:getInstance.getBool("userIsConnect")??false,userName:getInstance.getString("userName")));
  }
}

