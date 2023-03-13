import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kawa_mobile_visualizer/pages/product/DashboardProduct.dart';

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
                child: ConnectionForm(),
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
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  focusedBorder: OutlineInputBorder(),
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
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Mot de passe ',
                filled: true,
                fillColor: textFilledColor,
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              enableSuggestions: false,
              autocorrect: false,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir votre mot de passe';
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
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: ElevatedButton(
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

                        }))),
          ))
        ],
      ),
    );
  }
}
