import 'package:compteur/features/meteo/presenter/bloc/meteo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/widgets/texte.dart';
import '../../../../core/utils/constantes/palettes.dart';
import '../../../../core/utils/helpers/fonctions.dart';
import '../cubit/meteo_cubit.dart';
import '../widgets/box_meteo.dart';
import '../widgets/search_bar.dart';

class MeteoView extends StatelessWidget {
  const MeteoView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MeteoCubit>().state as MeteoInitialCubit;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Texte("Météo",taille: 22,couleur:CompteurFonction.isModeDark(context)?Colors.white:CompteurCouleur.secondaryColors),
              const SizedBox(height: 05),
              SearchBarre(onFieldSubmitted: (valeur){
                context.read<MeteoBloc>().add(GetMeteoEvent(valeur!));
              }
              ),
              const SizedBox(height: 20),
              context.watch<MeteoBloc>().state is MeteoLoading?
              SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.65,
                  child: Center(child: CircularProgressIndicator.adaptive())
              ):
              cubit.meteo==null?SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.65,
                  child: Center(child: Texte("Aucun résultat"))
              ):
              BoxMeteo(meteo: cubit.meteo!)
            ],
          ),
        ),
      ),
    );
  }
}
