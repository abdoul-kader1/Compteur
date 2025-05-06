part of 'meteo_cubit.dart';

@immutable
sealed class MeteoStateCubit {}

final class MeteoInitialCubit extends MeteoStateCubit {
  final Meteo?meteo;
  MeteoInitialCubit([this.meteo]);
}
