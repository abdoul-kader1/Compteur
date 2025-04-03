import 'package:flutter_bloc/flutter_bloc.dart';

class Incrementation{}

class BlocCompteurs extends Bloc<Incrementation,int>{

  BlocCompteurs():super(0){
    on<Incrementation>((event,emit){
      emit(state+1);
    });
  }
}