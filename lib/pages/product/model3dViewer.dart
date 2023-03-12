import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../models/Product.dart';
import '../../utils/constants.dart';

class ViewerModel3D extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
          title: Text(product.name!), backgroundColor: headerBackgroundColor),
      body: ModelViewer(
        backgroundColor: viewer3dColor,
        src: "assets/model3D/coffee_machine.glb",
        // a bundled asset file
        alt: product.details!.description!,
        ar: true,
        arModes: ['scene-viewer', 'webxr', 'quick-look'],
        autoRotate: true,
        cameraControls: true,
        iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
        disableZoom: false,
      ),
    );
  }
}
