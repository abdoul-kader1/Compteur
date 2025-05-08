import 'package:compteur/core/common/widgets/texte.dart';
import 'package:compteur/features/meteo/domain/entities/city_e.dart';
import 'package:compteur/features/meteo/domain/entities/meteo_e.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BoxMeteo extends StatelessWidget {
  final Meteo meteo;
  final City city;
  const BoxMeteo({super.key,required this.meteo, required this.city});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width: MediaQuery.sizeOf(context).width,height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image:AssetImage(
                meteo.weather[0].icon=="01d" ||meteo.weather[0].icon=="01n"?
                "assets/images/suns.jpg":meteo.weather[0].icon=="09d" ||meteo.weather[0].icon=="09n"||meteo.weather[0].icon=="10d" ||meteo.weather[0].icon=="10n"?
                "assets/images/pluie.jpg": meteo.weather[0].icon=="11d" ||meteo.weather[0].icon=="11n"?"assets/images/orage.jpg":
                meteo.weather[0].icon=="13d" ||meteo.weather[0].icon=="13n"?"assets/images/neige.jpg":"assets/images/nuage.jpg"
            ),
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
                  Texte(city.name,poids: FontWeight.bold,taille: 17,couleur: Colors.white),
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
