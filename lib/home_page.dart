import 'package:compteur/bloc/bloc.dart';
import 'package:compteur/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/authentifications/presentation/bloc/auth_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if(state is AuthSucces){
          return Scaffold(
            appBar: AppBar(title: Text(state.usernameAndPassword)),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (ctx){return CubitPage();}));},
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,height: 150,
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
                      width: 150,height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.amberAccent)
                      ),
                      child: Text("Bloc"),
                    ),
                  )
                ],
              ),
            ),
          );
        }else{
          return Container();
        };
  },
);
  }
}
