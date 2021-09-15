import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/image_local.dart';

// Example page. Testing, playing with widgets and compositions.
class ExamplePage2 extends StatelessWidget {
  const ExamplePage2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.comment),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ), //IconButton
        ], //<Widget>[]
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            margin: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              //   color: const Color(0xff7c94b6),
              color: Colors.pink[50],
            ),
            //  color: Colors.pink[100],
            //decoration:
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset('assets/images/placeholder.png'),
                    ),
                    Expanded(
                      flex: 3,
                      child: Image.asset('assets/images/placeholder2.png'),
                    ),
                    Expanded(
                      flex: 2,
                      child: Image.asset('assets/images/placeholder3.png'),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ImageLocalWidget(url: 'assets/images/placeholder.png'),
                      SizedBox(height: 10),
                      ImageLocalWidget(url: 'assets/images/placeholder3.png'),
                      SizedBox(height: 10),
                      ImageLocalWidget(url: 'assets/images/placeholder2.png'),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(width: 10),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: const [
                      ImageLocalWidget(url: 'assets/images/placeholder.png'),
                      ImageLocalWidget(url: 'assets/images/placeholder2.png'),
                      ImageLocalWidget(url: 'assets/images/placeholder3.png'),
                      ImageLocalWidget(url: 'assets/images/placeholder1.png'),
                      ImageLocalWidget(url: 'assets/images/placeholder4.jpg'),
                      ImageLocalWidget(url: 'assets/images/placeholder5.png'),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
