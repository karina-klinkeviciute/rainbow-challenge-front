import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rainbow_challenge/constants/api.dart';
import 'package:rainbow_challenge/pages/shop/shop_sucsess_claim.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/widgets/rainbow_price.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

class ShopItemPage extends StatefulWidget {
  ShopItemPage({
    Key? key,
    required this.amount_remaining,
    required this.uuid,
    required this.name,
    required this.description,
    required this.price,
    this.image,
  }) : super(key: key);
  String name;
  String description;
  String price;
  String? image;
  String uuid;
  int amount_remaining = 0;

  @override
  State<ShopItemPage> createState() => _ShopItemPageState();
}

class _ShopItemPageState extends State<ShopItemPage> {
  final DioClient dioClient = DioClient();

  int amountToSend = 1;

  @override
  Widget build(BuildContext context) {
    var _selectedValue;
    List<DropdownMenuItem<int>> _remainingAmount =
        createListofRemainingAmount();

    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        if (widget.image != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Hero(
                tag: widget.name,
                child: ImageExternalWidget(
                  url: widget.image!,
                  borderRadius: 12,
                )),
          ),
        Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(widget.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    height: 1.2)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      color: Colors.grey.shade300,
                                      height: 30,
                                      width: 2),
                                  RainbowPriceWidget(
                                    localIcon: 'assets/images/rainbow.png',
                                    price: widget.price,
                                    priceHight:
                                        MediaQuery.of(context).size.width * 0.1,
                                  )
                                ]),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: HtmlWidget(data: widget.description),
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                              flex: 2,
                              child: chooseAmount(
                                  _selectedValue, _remainingAmount)),
                          Expanded(flex: 1, child: SizedBox())
                        ],
                      ),
                      Center(
                        child: ElevatedButton(
                            child: Text('Užsakyti'),
                            onPressed: () {
                              registerPrizeClaim(
                                  uiid: widget.uuid,
                                  amountToSend: amountToSend);
                            }),
                      ),
                    ],
                  ),
                ),
              ])),
        ),
      ]),
    );
  }

  List<DropdownMenuItem<int>> createListofRemainingAmount() {
    List<DropdownMenuItem<int>> _remainingAmount = <int>[
      for (var i = 1; i <= widget.amount_remaining; i++) i
    ].map((int value) {
      return new DropdownMenuItem<int>(
        value: value,
        child: new Text(value.toString()),
      );
    }).toList();
    return _remainingAmount;
  }

  DropdownButtonFormField<int> chooseAmount(
      _selectedValue, List<DropdownMenuItem<int>> _remainingAmount) {
    return DropdownButtonFormField<int>(
      alignment: Alignment.center,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent))),
      hint: Text(
        'Pasirink kiekį',
      ),
      value: _selectedValue,
      key: const Key('Amount_textField'),
      onChanged: (choosedInt) => setState(() {
        amountToSend = choosedInt!;
      }),
      items: _remainingAmount,
    );
  }

  Future registerPrizeClaim({
    required int amountToSend,
    required String uiid,
  }) async {
    try {
      var errorMessage = await dioClient.postPrize(Api.claimPrizesEndpoint,
          {"amount": amountToSend, "prize": "${uiid}"});

      if (errorMessage.statusCode == 201) {
        return Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ShopSuccessPage()));
      }
    } catch (e) {
      // print(e);

      var er = e.toString();
      if (er.contains(RegExp('[)]|[(]|[}]|[{]|\\]|[[]'))) {
        er = er.replaceAll(RegExp('[)]|[(]|[}]|[{]|\\]|[[]'), '');
        setState(() {});
      }

      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Error: $er',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.redAccent,
      ));
    }
  }
}
