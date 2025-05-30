part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class ConnexionClient extends AuthEvent{
  final String email;
  final String mdp;
  final bool checkBox;
  final GlobalKey<FormState> keyform;
  final AppCubit appCubit;
  ConnexionClient(this.email,this.mdp,this.keyform,this.checkBox,this.appCubit);
}
