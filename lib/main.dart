import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'package:kawa_mobile_visualizer/pages/connection.dart';
import 'package:go_router/go_router.dart';
import 'package:kawa_mobile_visualizer/pages/product/DashboardProduct.dart';
import 'package:kawa_mobile_visualizer/pages/product/ProductDetails.dart';
import 'package:kawa_mobile_visualizer/pages/product/model3dViewer.dart';
import 'package:kawa_mobile_visualizer/pages/scan_qr_code.dart';

import 'models/Product.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Firebase Deeplink
  await Firebase.initializeApp();

  FirebaseDynamicLinks.instance.onLink;



  runApp(MaterialApp.router(routerConfig: _router, debugShowCheckedModeBanner: false,));
}
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'connection',
      builder: (BuildContext context, GoRouterState state) {
        return const ConnectionPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'qrCode',
          name: 'connectionWithQrCode',
          builder: (BuildContext context, GoRouterState state) {
            return const ConnectionWithQrCode();},
        ),
    ]
      ),
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
              return ProductDetails(
                  productId: state.params['productId'] as String,
                  productName: state.params['productName'] as String);
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


