import 'package:compteur/features/meteo/domain/repositorys/meteo_repository.dart';
import 'package:get_it/get_it.dart';
import '../../../features/meteo/data/datasources/meteo_remote.dart';
import '../../../features/meteo/data/repositories/meteo_repositorie_impl.dart';
import '../../../features/meteo/domain/usecases/get_meteo_usecase.dart';
import '../../../features/meteo/presenter/bloc/meteo_bloc.dart';
import '../../../features/meteo/presenter/cubit/meteo_cubit.dart';

final serviceLocator = GetIt.instance;

void initMeteo(){
  serviceLocator.registerFactory(()=>MeteoRemote());
  serviceLocator.registerFactory<MeteoRepository>(()=>MeteoRepositorieImpl(serviceLocator()));
  serviceLocator.registerFactory(()=>GetMeteoUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(()=>MeteoCubit());
  serviceLocator.registerLazySingleton(()=>MeteoBloc(serviceLocator(),serviceLocator()));
}