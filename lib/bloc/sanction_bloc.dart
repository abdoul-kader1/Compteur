import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sanction_event.dart';
part 'sanction_state.dart';

class SanctionBloc extends Bloc<SanctionEvent, SanctionState> {
  SanctionBloc() : super(SanctionInitial()) {
    on<SanctionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
