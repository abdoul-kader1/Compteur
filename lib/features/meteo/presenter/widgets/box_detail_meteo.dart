import 'dart:ui';

import 'package:compteur/core/common/widgets/texte.dart';
import 'package:flutter/material.dart';

class BoxDetailMeteo extends StatelessWidget {
  final String titre,temperature,description;
  final IconData icons;
  const BoxDetailMeteo({super.key, required this.titre, required this.temperature, required this.description, required this.icons});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        width: MediaQuery.sizeOf(context).width*0.44,height: 150,
        decoration: BoxDecoration(
            //color: Colors.red,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage("assets/images/meteo1.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken)
            )
        ),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4,sigmaY: 4),
              child: Container(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(icons,size: 18,color: Colors.white),const SizedBox(width: 05),Texte(titre.toUpperCase(),couleur: Colors.white)
                  ],
                ),
                const SizedBox(height: 10),
                Texte(temperature,taille: 20,couleur: Colors.white),
                const SizedBox(height: 05),
                Texte(description,couleur: Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }
}
