import 'package:compteur/bloc/bloc_compteur.dart';
import 'package:compteur/cubit/app/app_cubit.dart';
import 'package:compteur/cubit/cubit_compteur.dart';
import 'package:compteur/features/authentifications/presentation/cubit/mdp_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/authentifications/presentation/bloc/auth_bloc.dart';
import 'features/authentifications/presentation/cubit/auth_champ_cubit.dart';
import 'my_app.dart';

void main() {
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>CubitCompteur()),
          BlocProvider(create: (_)=>AppCubit()),
          BlocProvider(create: (_)=>BlocCompteurs()),
          BlocProvider(create: (_)=>AuthBloc()),
          BlocProvider(create: (_)=>AuthChampCubit()),
          BlocProvider(create: (_)=>MdpViewCubit())
        ],
        child:const MyApp()
    )
  );
}
