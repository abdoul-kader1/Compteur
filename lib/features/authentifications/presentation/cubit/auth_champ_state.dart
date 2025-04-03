part of 'auth_champ_cubit.dart';

@immutable
sealed class AuthChampState {}

final class AuthChampInitial extends AuthChampState {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController mdpController = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final bool checkbox;
  AuthChampInitial({this.checkbox=false});
}
