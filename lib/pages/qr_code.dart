import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/challenge/challenge_event_participant/qr_code_scanner/cubit/qr_code_scanner_cubit.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QrCodePage extends StatefulWidget {
  QrCodePage({
    Key? key,
  }) : super(key: key);

  @override
  QrCodePageState createState() {
    return QrCodePageState();
  }
}

class QrCodePageState extends State<QrCodePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR code');
  Barcode? result;
  String? qrCode;
  QRViewController? controller;

  QrCodePageState({this.qrCode});

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
                child: Text(AppLocalizations.of(context)!.challenge_event_touch_black_screen_for_qr),
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
      await scanChallenge();
      controller.resumeCamera();
    });
  }

  Future<void> scanChallenge() async {
    var qrCodeScannerCubit = BlocProvider.of<QrCodeScannerCubit>(context);
    String qrCode = result?.code ?? "";
    try {
      var response = await qrCodeScannerCubit.challengeRepository
          .scanChallenge(qr_code: qrCode);
      bool success = false;

      success = true;
      setState(() {});
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          elevation: 80,
          title: Text(AppLocalizations.of(context)!.message_thank_you),
          content: Text('$response',textAlign: TextAlign.center), //TODO add localizations
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
    } catch (e) {
      var er = e.toString();
      if (er.contains(RegExp('[)]|[(]|[}]|[{]|\\]|[[]'))) {
        er = er.replaceAll(RegExp('[)]|[(]|[}]|[{]|\\]|[[]'), '');
        print(er);
        if(er=="You have already completed this challenge"){
          er=AppLocalizations.of(context)!.challenge_completed_already;
        }        if(er=="QR code is invalid."){
          er=AppLocalizations.of(context)!.challenge_event_qr_code_incorrect;
        }
        
        setState(() {});
      }
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          elevation: 80,
          title: Text(AppLocalizations.of(context)!.message_thank_you),
          content: Text('${er}',textAlign: TextAlign.center),
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
      Navigator.pop(context);
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