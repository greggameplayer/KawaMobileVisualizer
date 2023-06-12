import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../services/connection.dart';
import '../utils/constants.dart';

class ConnectionWithQrCode extends StatelessWidget {
  const ConnectionWithQrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner'),
                      backgroundColor: headerBackgroundColor),
      body: MobileScanner(
        // fit: BoxFit.contain,
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.normal,
          facing: CameraFacing.back,
          torchEnabled: false,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            String token = barcode.rawValue!;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(token),
                duration: const Duration(seconds: 2),
              ),
            );
            checkAndConnect(token, context);
          }
        },
      ),
    );
  }
}
