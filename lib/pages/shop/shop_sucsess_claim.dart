import 'package:flutter/material.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/widgets/wrapper_main.dart';

class ShopSuccessPage extends StatelessWidget {
  const ShopSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
      useAppBar: false,
      index: 3,
      mainArea: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
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
                      return NewsPage(index: 3);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
