import 'package:kawa_mobile_visualizer/models/Product.dart';
import 'package:kawa_mobile_visualizer/services/product_api.dart';
import 'package:flutter/material.dart';


//To call the API
//getOneProductFromMock("1").then((value) => {
//setState(() {
//products = value;
//print(products.name);
//print(products.stock);
//})
//});

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
        title: const Text('Lists des produits'),
      ),
      body: FutureBuilder<List<Product>>(
        future: getProductsFromMock(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name!),
                  subtitle: Text(snapshot.data![index].details!.description!),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Id produit'),
                            content: Text(snapshot.data![index].id!),
                          );
                        });
                  },
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