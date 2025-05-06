import 'dart:convert';
import 'package:compteur/core/utils/exceptions/serveur_exception.dart';
import 'package:http/http.dart' as http;

class CompteurRequetes{
  CompteurRequetes._();

  //ajouter une donnée dans BDD
  static Future<T>create<T>({
    required String urlApi,required String endPoint,
    required Map<String,dynamic> donnee,String?autorization
  })async{
    Uri url = Uri.parse("$urlApi$endPoint");
    final envoieRequetes = await http.post(
        url,
        body: jsonEncode(donnee),
        headers: {'Content-Type':'application/json',if(autorization!=null)"Authorization":"Bearer $autorization"}
    );
    return reponse(envoieRequetes);
  }
  //lire des données dans la BDD
  static Future<T>read<T>({
    required String urlApi,required String endPoint,String?autorization
  })async{
    Uri url = Uri.parse("$urlApi$endPoint");
    final envoieRequetes = await http.get(
        url,
        headers: {if(autorization!=null)"Authorization":"Bearer $autorization"}
    );
    return reponse(envoieRequetes);
  }
  //mettre a jour les informations de la BDD
  static Future<T>update<T>({
    required String urlApi,required String endPoint,
    required Map<String,dynamic>donnee,String?autorization
  })async{
    Uri url = Uri.parse("$urlApi$endPoint");
    final envoieRequete = await http.put(
        url,
        body: jsonEncode(donnee),
        headers: {"Content-Type":"application/json",if(autorization!=null)"Authorization":"Bearer $autorization"}
    );
    return reponse(envoieRequete);
  }
  //supprimer un element dans la BDD
  static Future<T>delete<T>({
    required String urlApi,required String endPoint,Map<String,dynamic>?donnee,String?autorization
  })async{
    Uri url = Uri.parse("$urlApi$endPoint");
    final envoieRequete = await http.delete(
        url,
        body: jsonEncode(donnee),
        headers: {"Content-Type":"application/json",if(autorization!=null)"Authorization":"Bearer $autorization"}
    );
    return reponse(envoieRequete);
  }

  static T reponse<T>(http.Response response){
    if(response.statusCode == 201 || response.statusCode == 200){
      final donnee = utf8.decode(response.bodyBytes);
      return donnee.isEmpty?"":jsonDecode(donnee);
    }else{
      final donnee = utf8.decode(response.bodyBytes);
      final resultat = jsonDecode(donnee);
      final erreur = resultat["message"];
      throw ServeurException("Erreur : $erreur");
    }
  }
}