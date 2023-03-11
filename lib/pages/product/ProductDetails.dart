import 'package:flutter/material.dart';
import 'package:kawa_mobile_visualizer/models/Product.dart';
import 'package:kawa_mobile_visualizer/services/product_api.dart';

import '../../utils/constants.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>{
  late Product product;

  @override
  Widget build(BuildContext context) {
    //Product product =  ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: headerBackgroundColor
      ),
      body: FutureBuilder<Product>(
        future: getOneProductFromMock(ModalRoute.of(context)!.settings.arguments as String),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            product = snapshot.data!;
            return Column(
              children: [
                Text(product.name!),
                Text(product.details!.description!),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );

    //rAlternative
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


