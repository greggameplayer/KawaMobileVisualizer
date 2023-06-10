import 'package:go_router/go_router.dart';
import 'package:kawa_mobile_visualizer/models/Product.dart';
import 'package:kawa_mobile_visualizer/services/product_api.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../connection.dart';
import 'ProductDetails.dart';

class DashboardProduct extends StatefulWidget {
  const DashboardProduct({super.key});

  @override
  _DashboardProductState createState() => _DashboardProductState();
}

class _DashboardProductState extends State<DashboardProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Liste des produits'),actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout),
          tooltip: 'Show Snackbar',
          onPressed: () {
            GoRouter.of(context).goNamed('connection');
          },
        ),
      ]
          ,
          backgroundColor: headerBackgroundColor),
      body: FutureBuilder<List<Product>>(
        future: getProductsFromMock(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[200],
                  child: ListTile(
                      title: Text(snapshot.data![index].name!),
                      subtitle:
                          Text(snapshot.data![index].details!.description!),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      onTap: () =>
                        context.goNamed('detailsProduct', params: {'productId': snapshot.data![index].id!, 'productName': snapshot.data![index].name!})
                      ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
