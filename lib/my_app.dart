import 'package:compteur/cubit/app/app_cubit.dart';
import 'package:compteur/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/authentifications/presentation/pages/connexion.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    context.read<AppCubit>().initialisationApp();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocBuilder<AppCubit,AppState>(
          builder: (context,state){
            final data = state as AppInitial;
            if(data.userConnect!=null){
              return data.userConnect! == true?MyHomePage():Connexion();
            }else{
              return Container(color: Theme.of(context).colorScheme.surface);
            }
          }
      ),
    );
  }
}