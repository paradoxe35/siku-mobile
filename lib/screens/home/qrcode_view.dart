import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:siku/network/validation.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView();

  @override
  _QrCodeViewState createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 3.7,
          left: MediaQuery.of(context).size.width / 4.3,
          child: Column(
            children: [
              const FlashLightIcon(),
              InkWell(
                onTap: () {
                  _controller.toggleFlash();
                },
                child: Icon(
                  Icons.wb_sunny,
                  color: Colors.white60,
                  size: 20,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void onQRViewCreated(QRViewController controller) {
    _controller = controller;
    _controller.scannedDataStream.listen((scanData) {
      _validate(scanData);
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _validate(String code) {
    _controller.pauseCamera();
    validation(context, code, () {
      _controller.resumeCamera();
    });
  }
}

class FlashLightIcon extends StatelessWidget {
  const FlashLightIcon();
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.crop_free,
      color: Colors.white70,
      size: 200,
    );
  }
}
