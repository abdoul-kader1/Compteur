import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCompteur extends Cubit<int>{

  CubitCompteur():super(0);

  void incrementation(){
    emit(state +1);
  }

}