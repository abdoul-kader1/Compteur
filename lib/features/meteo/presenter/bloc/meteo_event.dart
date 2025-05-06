part of 'meteo_bloc.dart';

@immutable
sealed class MeteoEvent {}

final class GetMeteoEvent extends MeteoEvent{
  final String query;
  GetMeteoEvent(this.query);
}
