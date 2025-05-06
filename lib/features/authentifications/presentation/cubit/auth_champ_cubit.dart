import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_champ_state.dart';

class AuthChampCubit extends Cubit<AuthChampState> {

  AuthChampCubit() : super(AuthChampInitial());

  changeValeurCheckBox(bool?valeur){
    emit(AuthChampInitial(checkbox: valeur!));
  }


}
