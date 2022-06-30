import 'package:flutter/material.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/pages/profile/profile_page.dart';
import 'package:rainbow_challenge/widgets/wrapper_main.dart';

class PasswordChangeConfirm extends StatelessWidget {
  const PasswordChangeConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
      useAppBar: false,
      index: 1,
      mainArea: Column(
        children: [
          Text(
            'Slaptažodis pakeistas sėkmingai',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            child: Text('Grįžti į profilį'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return NewsPage(index: 1);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
