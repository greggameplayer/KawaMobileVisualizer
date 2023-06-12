
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:kawa_mobile_visualizer/models/TokenValidation.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> checkConnexionWithDeepLink(BuildContext context) async {
  FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {

    String token = dynamicLinkData.link.queryParameters['token']!;

    if(token.isNotEmpty){
      checkTokenIsValid(context, token).then((value) => {
        if(value){
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text('Connexion en cours...'))),
          GoRouter.of(context).goNamed('dashboardProduct')
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text('Une erreur est survenue lors de la connexion'))),
          GoRouter.of(context).goNamed('connection')
        }
      });
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Une erreur est survenue lors de la récupération du token')));
      GoRouter.of(context).goNamed('connection');
    }

  }, onError: (error) {
  });
}

void checkAndConnect(String token, BuildContext context){
  checkTokenIsValid(context, token).then((value) => {
    if(value){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              duration: Duration(seconds: 2),
              content: Text('Connexion en cours...'))),
      GoRouter.of(context).goNamed('dashboardProduct')
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              duration: Duration(seconds: 2),
              content: Text('Une erreur est survenue lors de la connexion'))),
      GoRouter.of(context).goNamed('connection')
    }
  });
}

Future<bool> checkTokenIsValid(BuildContext context, String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final url = Uri.parse('https://vendor-mspr4.gregsvc.fr/api/vendors/isValid');

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  Map<String, String> requestBody = {
    'token': token
  };

  var response = await http.post(url, headers: requestHeaders, body: requestBody);

  if (response.statusCode == 200) {
    var json = response.body;
    TokenValidation tokenValidation = TokenValidation.fromJson(json as Map<String, dynamic>);
    if(tokenValidation.valid == true && tokenValidation.expired == false){
      prefs.setString('token', token);
      return true;
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Votre connexion a expiré, veuillez vous reconnecter')));
      GoRouter.of(context).goNamed('connection');
      prefs.remove('token');
      return false;
    }
  } else {
    return throw Exception('No data found') ;
  }
}
