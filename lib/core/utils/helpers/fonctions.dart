import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompteurFonction{

  CompteurFonction._();

  static bool isModeDark(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static String formateurDateComplet(DateTime date){

    final jour = DateFormat("EEEE","fr").format(date);
    final heure = DateFormat("j","fr").format(date);
    return "$jour : $heure";

  }

  static String formateurDateHm(DateTime date){
    return DateFormat("Hm").format(date);
  }

}