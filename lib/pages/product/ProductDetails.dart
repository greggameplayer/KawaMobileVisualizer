import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kawa_mobile_visualizer/models/Product.dart';
import 'package:kawa_mobile_visualizer/services/product_api.dart';

import '../../utils/constants.dart';
import '../../widgets/button.dart';
import 'model3dViewer.dart';

class ProductDetails extends StatefulWidget {
  //final String productName;
  final String productId;
  final String productName;
  const ProductDetails({Key? key, required this.productId, required this.productName}): super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    late Product productDetails;

    return Scaffold(
      appBar: AppBar(
          title: Text(widget.productName), backgroundColor: headerBackgroundColor),
      body: FutureBuilder<Product>(
        //future: getOneProductFromMock(ModalRoute.of(context)!.settings.arguments as String),
        future: getOneProductFromMock(widget.productId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var productDetails = snapshot.data!;
            return Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 20.0),
                  child: Text(
                    "Description : " + productDetails.details!.description!,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 20.0),
                  child: Text(
                    "Prix : " + productDetails.details!.price! + "€",
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: ElevatedButton(
                                style: styleButtonApp,
                                onPressed: () {
                                  context.pushNamed("showModel3D",extra:productDetails);
                                },
                                child: const Text(
                                  "Visualiser",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ))),
                  ]),
                ),
              ),
              //Text(product.details!.description!),
            ]);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}