import 'package:compteur/bloc/bloc_compteur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    final instance = BlocProvider.of<BlocCompteurs>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Bloc architecture"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<BlocCompteurs,int>(
                builder: (context,donnee){
                return Text(
                  "$donnee",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          instance.add(Incrementation());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
