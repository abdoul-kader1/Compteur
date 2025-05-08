import 'package:compteur/features/meteo/presenter/bloc/meteo_bloc.dart';
import 'package:compteur/features/meteo/presenter/widgets/animations.dart';
import 'package:compteur/features/meteo/presenter/widgets/box_prevision_meteo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/common/widgets/texte.dart';
import '../../../../core/utils/constantes/palettes.dart';
import '../../../../core/utils/helpers/fonctions.dart';
import '../cubit/meteo_cubit.dart';
import '../widgets/box_detail_meteo.dart';
import '../widgets/box_meteo.dart';
import '../widgets/search_bar.dart';

class MeteoView extends StatelessWidget {
  const MeteoView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MeteoCubit>().state as MeteoInitialCubit;
    return BlocConsumer<MeteoBloc,MeteoState>(
        builder:(context,state){
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
                    state is MeteoLoading?
                    SizedBox(
                        height: MediaQuery.sizeOf(context).height*0.65,
                        child: Center(child: CircularProgressIndicator.adaptive())
                    ):
                    cubit.meteos==null?SizedBox(
                        height: MediaQuery.sizeOf(context).height*0.65,
                        child: Center(child: OpaciterTransition(tempsApparution: 50, child: Texte("Aucun résultat")))
                    ):OpaciterTransition(tempsApparution: 150, child: BoxMeteo(meteo: cubit.meteos!.meteos[0], city: cubit.meteos!.city)),
                    SizedBox(height: 10),
                    if(cubit.meteos!=null && state is MeteoInitial)OpaciterTransition(tempsApparution: 50,child: BoxPrevisionMeteo(meteos: cubit.meteos!.meteos)),
                     if(cubit.meteos!=null && state is MeteoInitial)SizedBox(height: 10),
                     if(cubit.meteos!=null && state is MeteoInitial)OpaciterTransition(
                       tempsApparution: 50,
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoxDetailMeteo(titre: 'ressenti', temperature: '${cubit.meteos!.meteos[0].main.feelsLike}º', description: 'Le ressenti humain en température', icons: FontAwesomeIcons.temperatureEmpty),
                          BoxDetailMeteo(titre: 'humidité', temperature: '${cubit.meteos!.meteos[0].main.humidity}%', description: "L'humidité en pourcentage", icons: FontAwesomeIcons.droplet)
                        ],
                                           ),
                     ),
                     if(cubit.meteos!=null && state is MeteoInitial)const SizedBox(height: 10),
                     if(cubit.meteos!=null && state is MeteoInitial)OpaciterTransition(
                       tempsApparution: 50,
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoxDetailMeteo(titre: 'pression', temperature: '${cubit.meteos!.meteos[0].main.pressure} hPa', description: 'Préssion atmosphérique de la mer', icons: FontAwesomeIcons.gauge),
                          BoxDetailMeteo(titre: 'Vent', temperature: '${cubit.meteos!.meteos[0].wind.speed} m/s', description: "Rafale de vent.", icons: FontAwesomeIcons.wind)
                        ],
                                           ),
                     ),
                     if(cubit.meteos!=null && state is MeteoInitial)const SizedBox(height: 10),
                     if(cubit.meteos!=null && state is MeteoInitial)OpaciterTransition(
                       tempsApparution: 50,
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoxDetailMeteo(titre: 'lever', temperature: CompteurFonction.formateurDateHm(cubit.meteos!.city.surnrise), description: "Lever du soleil", icons: FontAwesomeIcons.sun),
                          BoxDetailMeteo(titre: 'coucher', temperature: CompteurFonction.formateurDateHm(cubit.meteos!.city.sunset), description: 'Coucher du soleil', icons: FontAwesomeIcons.cloudSun),
                       
                        ],
                                           ),
                     )
                  ],
                ),
              ),
            ),
          );
        },
      listener: ( context,state){
          if(state is MeteoEchec)ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Texte(state.echec)));
      },
    );
  }
}
