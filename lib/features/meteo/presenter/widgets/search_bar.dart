import 'package:compteur/core/utils/constantes/palettes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/helpers/fonctions.dart';

class SearchBarre extends StatelessWidget {
  final void Function(String?)?onChanged;
  final void Function(String?)?onFieldSubmitted;
  const SearchBarre({super.key, this.onChanged,this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: CompteurFonction.isModeDark(context)?Colors.white:CompteurCouleur.secondaryColors),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          fillColor:CompteurFonction.isModeDark(context)?Theme.of(context).colorScheme.surfaceContainer:CompteurCouleur.greyColors,
          filled: true,
          isDense:true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.transparent)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.transparent)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.transparent)
          ),
          hintText: "Ville ou commune",
          prefixIcon:  Icon(FontAwesomeIcons.magnifyingGlass,size: 15,color:CompteurFonction.isModeDark(context)?Colors.white:CompteurCouleur.secondaryColors)
      ),
    );
  }
}