import 'package:compteur/core/common/widgets/texte.dart';
import 'package:compteur/features/meteo/domain/entities/meteo_e.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoxMeteo extends StatelessWidget {
  final Meteo meteo;
  const BoxMeteo({super.key,required this.meteo});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      width: MediaQuery.sizeOf(context).width,height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage(meteo.weather[0].main=="Clouds"?"assets/images/nuage.jpg":"assets/images/suns.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texte(meteo.name,poids: FontWeight.bold,taille: 17,couleur: Colors.white),
                  Row(
                    children: [
                      Texte("Vitesse du vent : ${meteo.wind.speed} ",couleur: Colors.white),
                      Icon(FontAwesomeIcons.arrowTrendUp,size: 16,color: Colors.white)
                    ],
                  )
                ],
              ),
              Texte("${meteo.main.temp}º",taille: 30,poids: FontWeight.w700,couleur: Colors.white)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Texte(meteo.weather[0].description,couleur: Colors.white,poids: FontWeight.bold,),
              SizedBox(
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.arrowUp,size: 13,color: Colors.white),Texte("${meteo.main.tempMax}º ",poids: FontWeight.w700,couleur: Colors.white),
                    Icon(FontAwesomeIcons.arrowDown,size: 13,color: Colors.white),Texte("${meteo.main.tempMin}º",poids: FontWeight.w700,couleur: Colors.white),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
