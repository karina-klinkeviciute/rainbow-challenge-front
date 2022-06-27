import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_event_participant/qr_code_scanner/cubit/qr_code_scanner_cubit.dart';
import 'package:rainbow_challenge/widgets/auth_text_field.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerPage extends StatefulWidget {
  QrCodeScannerPage({Key? key, required this.uuid}) : super(key: key);
  final String uuid;

  @override
  QrCodeScannerPageState createState() {
    return QrCodeScannerPageState(uuid: uuid);
  }
}

class QrCodeScannerPageState extends State<QrCodeScannerPage> {
  String uuid;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  String? qrCode;
  QRViewController? controller;

  QrCodeScannerPageState({required this.uuid, this.qrCode});

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: (result != null)
                    ? Text('QR kodas neteisingas')
                    : Text('Skenuok QR kodą'),
              ),
            ),
            //in case we need to add manually qr code
            // Expanded(
            //   flex: 1,
            //   child: AuthTextField(
            //       padding: EdgeInsets.symmetric(
            //         horizontal: MediaQuery.of(context).size.width * 0.35,
            //       ),
            //       hint: 'Lytis, jei kita',
            //       key: const Key('GenderOther_textField'),
            //       isRequiredField: false,
            //       keyboardType: TextInputType.text,
            //       onChanged: (value) => setState(() async {
            //             qrCode = value;
            //             await completeChallenge();
            //           })),
            // )
          ],
        ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      setState(() {
        result = scanData;
      });
      print("QR scanned");
      await completeChallenge();
      controller.resumeCamera();
    });
  }

  Future<void> completeChallenge() async {
    var qrCodeScannerCubit = BlocProvider.of<QrCodeScannerCubit>(context);
    String qrCode = result?.code ?? "";
    var completedChallenge = await qrCodeScannerCubit.challengeRepository
        .completeChallenge(uuid: uuid, qr_code: qrCode);

    bool success = false;
    if (completedChallenge.main_joined_challenge.status == "confirmed") {
      success = true;
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Ačiū'),
          content: const Text(
              'Ačiū už atliktą užduotį! Jums įskaičiuota vaivorykščių.'), //TODO add localizations
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );

      Navigator.pop(context, success);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class _Page extends StatelessWidget {
  _Page({Key? key, required this.uuid}) : super(key: key);
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
        mainArea: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Container()));
  }
}

// Next: How do I get a joined challenge type uuid? It's needed to post together
// With the qr code.

// Process: 
// Challenges page: concrete_challenge_uuid = challenge type uuid; 
// If I know challenge type uuid, how do I get joined challenge type uuid then?
// Do i need it at all for completing the challenge?

// BlocBuilder 
// Form validation 
// completeChallenge() to API 