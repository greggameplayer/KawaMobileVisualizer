
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> checkConnexionWithDeepLink(BuildContext context) async {
  FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {

    String token = dynamicLinkData.link.queryParameters['token']!;
    String url = dynamicLinkData.link.fragment;

    if(token.isNotEmpty){

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Un erreur est survenue lors de la récupération du token')));
      GoRouter.of(context).goNamed('connection');
    }

  }, onError: (error) {
  });
}

void checkAndConnect(String token, BuildContext context){
  //TODO check token with API
  //TODO if token is valid, save token in local storage
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          duration: Duration(seconds: 2),
          content: Text('Connexion en cours...')));
  GoRouter.of(context).goNamed('dashboardProduct');
}
