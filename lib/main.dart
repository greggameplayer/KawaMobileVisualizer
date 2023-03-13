import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kawa_mobile_visualizer/pages/connection.dart';
import 'package:go_router/go_router.dart';
import 'package:kawa_mobile_visualizer/pages/product/DashboardProduct.dart';
import 'package:kawa_mobile_visualizer/pages/product/ProductDetails.dart';
import 'package:kawa_mobile_visualizer/pages/product/model3dViewer.dart';

import 'models/Product.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'GoRouter Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const ConnectionPage();
      }),
    GoRoute(
        path: '/dashboardProduct',
        name: 'dashboardProduct',
        builder: (BuildContext context, GoRouterState state) {
          return const DashboardProduct();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'detailsProduct/:productId/:productName',
            name: 'detailsProduct',
            builder: (BuildContext context, GoRouterState state) {
              return ProductDetails(productId: state.params['productId'] as String, productName: state.params['productName'] as String);
            },
          ),
          GoRoute(
            path: 'showModel3D',
            name: 'showModel3D',
            builder: (BuildContext context, GoRouterState state) {
              Product productToPass = state.extra as Product;
              return ViewerModel3D(product: productToPass);
            },
          ),
        ]
    ),
  ],
);




