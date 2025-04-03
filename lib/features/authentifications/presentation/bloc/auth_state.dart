part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {
  final bool checkBox;
  AuthInitial([this.checkBox = false]);
}

final class AuthSucces extends AuthState {
  final String usernameAndPassword;
  AuthSucces(this.usernameAndPassword);
}

final class AuthEchec extends AuthState{
  final String erreur;
  AuthEchec(this.erreur);
}

final class AuthLoading extends AuthState{}
