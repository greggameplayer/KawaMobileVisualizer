import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../models/Product.dart';
import '../../utils/constants.dart';

class ViewerModel3D extends StatelessWidget {
  final Product product;
  const ViewerModel3D({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text(product!.name!), backgroundColor: headerBackgroundColor),
      body: ModelViewer(
        backgroundColor: viewer3dColor,
        src: "assets/model3D/coffee_machine.glb",
        // a bundled asset file
        alt: product!.details!.description!,
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
