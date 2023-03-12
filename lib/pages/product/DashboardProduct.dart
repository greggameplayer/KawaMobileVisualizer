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
          title: const Text('Liste des produits'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Show Snackbar',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConnectionPage(),
                  ),
                );
              },
            ),
          ],
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(),
                            settings: RouteSettings(
                              arguments: snapshot.data![index],
                            ),
                          ),
                        );
                      }),
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
