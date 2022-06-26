import 'package:flutter/material.dart';
import 'package:rainbow_challenge/pages/pages.dart';

class ShopSuccessPage extends StatelessWidget {
  const ShopSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(30.0),
      child: SafeArea(
        bottom: true,
        top: true,
        child: Column(
          children: [
            Text(
              'Užsakymas išsiųstas. Susisieksim su tavim el. paštu ir pranešim, kaip atsiimti prizus.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              child: Text('Grįžti'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NewsPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
