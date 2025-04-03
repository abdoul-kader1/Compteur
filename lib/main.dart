import 'package:compteur/bloc/bloc_compteur.dart';
import 'package:compteur/cubit/cubit_compteur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/authentifications/presentation/bloc/auth_bloc.dart';
import 'features/authentifications/presentation/cubit/auth_champ_cubit.dart';
import 'features/authentifications/presentation/pages/connexion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>CubitCompteur()),
        BlocProvider(create: (_)=>BlocCompteurs()),
        BlocProvider(create: (_)=>AuthBloc()),
        BlocProvider(create: (_)=>AuthChampCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Connexion(),
      ),
    );
  }
}
