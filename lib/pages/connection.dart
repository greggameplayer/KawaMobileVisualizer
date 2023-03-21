import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/constants.dart';
import '../widgets/button.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logo_w_background.jpg",
                  width: 300,
                  height: 300,
                )),
          ),

          Expanded(
            child:Container(
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child:
                    ConnectionForm(),
                    //ButtonQrCode(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ConnectionForm extends StatefulWidget {
  const ConnectionForm({Key? key}) : super(key: key);

  @override
  ConnectionFormState createState() {
    return ConnectionFormState();
  }
}

class ConnectionFormState extends State<ConnectionForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final tokenController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    checkConnexionWithDeepLink(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: TextFormField(
                // The validator receives the text that the user has entered.
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email ',
                  filled: true,
                  fillColor: textFilledColor,
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre email';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: TextFormField(
              controller: tokenController,
              decoration: const InputDecoration(
                hintText: 'Token ',
                filled: true,
                fillColor: textFilledColor,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir token';
                }
                return null;
              },
            ),
          ),
          Expanded(
              child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: styleButtonApp,
                            child: const Text(
                              "Connexion",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Connexion en cours...')));
                                GoRouter.of(context).goNamed('dashboardProduct');
                              }

                            }),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: ButtonQrCode(),
                        ),
                      ],
                    ))),
          ))
        ],
      ),
    );
  }
}

Future<void> checkConnexionWithDeepLink(BuildContext context) async {
  FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {

    //https://kawamobilevisualizer.page.link/?link=htt?link=ps://kawamobilevisualizer.page.link/dashboardProduct?token=123coucou&apn=com.kawa.kawa_mobile_visualizer
    //https://kawamobilevisualizer.page.link/?link=https://kawamobilevisualizer.page.link/connect?token=123coucou&apn=com.kawa.kawa_mobile_visualizer
    print("Start");
    print(dynamicLinkData.toString());
    print(dynamicLinkData.utmParameters.toString());
    print(dynamicLinkData.link.toString());
    print(dynamicLinkData.link.pathSegments.toString());
    print(dynamicLinkData.link.path.toString());
    print(dynamicLinkData.link.normalizePath().toString());
  print(dynamicLinkData.link.queryParameters.toString());

    dynamicLinkData.utmParameters.forEach((key, value) {
      print("Key : $key");
      print("Value : $value");
    });
    dynamicLinkData.link.queryParameters.forEach((key, value) {
      print("Key : $key");
      print("Value : $value");
    });
    print("Link :" );
    print("Link :" );
    print("Link :" );
    print(dynamicLinkData.link.path);
    print(dynamicLinkData.link.fragment);
    print(dynamicLinkData.link.toString());
    print("End");
    print("End");
    print("End");
    print("End");
    GoRouter.of(context).go(dynamicLinkData.link.fragment);
  }).onError((error) {
    // Handle errors
  });
}


class ButtonQrCode extends StatelessWidget {
  const ButtonQrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: styleButtonApp,
      onPressed: () {GoRouter.of(context).goNamed('connectionWithQrCode');},
      child: const Text(
        "Scanner le QR code",
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
