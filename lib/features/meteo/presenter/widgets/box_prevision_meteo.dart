import 'dart:ui';

import 'package:compteur/core/common/widgets/texte.dart';
import 'package:compteur/core/utils/constantes/palettes.dart';
import 'package:compteur/core/utils/helpers/fonctions.dart';
import 'package:compteur/features/meteo/domain/entities/meteo_e.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoxPrevisionMeteo extends StatelessWidget {
  final List<Meteo>meteos;
  const BoxPrevisionMeteo({super.key,required this.meteos});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding:EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage("assets/images/meteo.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken)
            ),
        ),
        child: Stack(
          children: [
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4,sigmaY: 4),
              child: Container(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month,size: 18,color: Colors.white),SizedBox(width: 05),Texte("10 Prévisions",couleur: Colors.white)
                  ],
                ),
                const SizedBox(height: 02),
                Divider(color: CompteurCouleur.greyColors),
                for(var i=0;i<10;i++)...[
                  Container(
                    width: MediaQuery.sizeOf(context).width,height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                        border: i<9?Border(bottom: BorderSide(color: CompteurCouleur.greyColors)):null
                    ),
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.sizeOf(context).width*0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Texte(CompteurFonction.formateurDateComplet(meteos[i].dt),couleur: Colors.white),
                              Tooltip(
                                triggerMode: TooltipTriggerMode.tap,
                                message: meteos[i].weather[0].description,
                                  child: Image.network("https://openweathermap.org/img/wn/${meteos[i].weather[0].icon}@2x.png")
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width*0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(FontAwesomeIcons.arrowUp,size: 13,color: Colors.white),Texte("${meteos[i].main.tempMax}º ",poids: FontWeight.w700,couleur: Colors.white),
                              Icon(FontAwesomeIcons.arrowDown,size: 13,color: Colors.white),Texte("${meteos[i].main.tempMin}º",poids: FontWeight.w700,couleur: Colors.white),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ],
            )
          ],
        ),
      ),
    );
  }
}
