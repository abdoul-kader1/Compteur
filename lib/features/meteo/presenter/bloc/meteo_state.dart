part of 'meteo_bloc.dart';

@immutable
sealed class MeteoState {}

final class MeteoInitial extends MeteoState {}

final class MeteoLoading extends MeteoState {}

final class MeteoEchec extends MeteoState {
  final String echec;
  MeteoEchec(this.echec);
}
