import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeView extends StatefulWidget {
  @override
  _QrCodeViewState createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          // child: QRView(
          //   key: qrKey,
          //   onQRViewCreated: _onQRViewCreated,
          // ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 3.7,
          left: MediaQuery.of(context).size.width / 4.3,
          child: Column(
            children: [
              const MenuButton(),
              InkWell(
                onTap: () {
                  controller.toggleFlash();
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

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton();
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.crop_free,
      color: Colors.white70,
      size: 200,
    );
  }
}
