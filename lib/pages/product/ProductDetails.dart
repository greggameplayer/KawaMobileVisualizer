import 'package:flutter/material.dart';
import 'package:kawa_mobile_visualizer/models/Product.dart';
import 'package:kawa_mobile_visualizer/services/product_api.dart';

import '../../utils/constants.dart';
import '../../widgets/button.dart';
import 'model3dViewer.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late Product product;

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    late Product productDetails;

    return Scaffold(
      appBar: AppBar(
          title: Text(product.name!), backgroundColor: headerBackgroundColor),
      body: FutureBuilder<Product>(
        //future: getOneProductFromMock(ModalRoute.of(context)!.settings.arguments as String),
        future: getOneProductFromMock(product.id!),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewerModel3D(),
                                      settings: RouteSettings(
                                        arguments: snapshot.data!,
                                      ),
                                    ),
                                  );
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

    //Alternative
    /*return Scaffold(
      appBar: AppBar(
        title: Text(product.name!),
      ),
      body: Column(
        children: [
          Text(product.details!.description!),
        ],
      ),
    ) ;
    */
  }
}
