import 'package:compteur/cubit/app/app_cubit.dart';
import 'package:compteur/features/authentifications/presentation/pages/connexion.dart';
import 'package:compteur/features/meteo/presenter/pages/meteo_view.dart';
import 'package:compteur/pages/bloc_page.dart';
import 'package:compteur/pages/cubit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<AppCubit>().getUserName();
  }
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AppCubit>().state as AppInitial;
    return Scaffold(
      appBar: AppBar(
          title: Text("Bonjour ${bloc.userName??""}"),
          actions: [
            IconButton(
                onPressed: (){
                  context.read<AppCubit>().changeUserIsConnect(false);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx){
                    return Connexion();
                  }));
                  },
                icon: Icon(Icons.exit_to_app_outlined)
            )
          ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (ctx){return CubitPage();}));},
              child: Container(
                alignment: Alignment.center,
                width: 100,height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.amberAccent)
                ),
                child: Text("Cubit"),
              ),
            ),const SizedBox(width: 20),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (ctx){return BlocPage();}));},
              child: Container(
                alignment: Alignment.center,
                width: 100,height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.amberAccent)
                ),
                child: Text("Bloc"),
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (ctx){return MeteoView();}));},
              child: Container(
                alignment: Alignment.center,
                width: 100,height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.amberAccent)
                ),
                child: Text("Météo"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
