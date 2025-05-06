import 'package:flutter_bloc/flutter_bloc.dart';

class MdpViewCubit extends Cubit<bool> {

  MdpViewCubit() : super(true);

  changeViewMdo(){
    emit(!state);
  }
}
