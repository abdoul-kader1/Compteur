import 'package:flutter/material.dart';

class CompteurFonction{

  CompteurFonction._();

  static bool isModeDark(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
}