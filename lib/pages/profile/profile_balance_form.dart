import 'package:flutter/material.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/utils/model/available_prize/prize_class.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';

class ProfileRainbowForm extends StatelessWidget {
  ProfileRainbowForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
      useAppBar: false,
      index: 1,
      mainArea: FutureBuilder<RainbowBalance>(
          future: getData(),
          builder: (context, AsyncSnapshot<RainbowBalance> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              var earnings = snapshot.data?.earning;
              var spendings = snapshot.data?.spending;
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Center(child: const HeadlineWidget(title: 'Vaivorykštės')),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Gautos vaivorykštės:      ${snapshot.data!.earnedRainbows.toString()}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Aktyvios vaivorykštės:  ${snapshot.data!.remainingRainbows.toString()}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                      child: Text(
                        'Vaivorykštės gavai už šias užduotis:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    DataTable(
                      border: TableBorder.all(
                          borderRadius: BorderRadius.circular(20)),
                      columns: [
                        DataColumn(
                          label: Expanded(
                            child: Text('Užduoties Pavadinimas'),
                          ),
                        ),
                        DataColumn(
                            label: ImageLocalWidget(
                          url: 'assets/images/rainbow.png',
                          height: MediaQuery.of(context).size.height * 0.05,
                        ))
                      ],
                      rows: earnings!
                          .map((e) => DataRow(cells: [
                                DataCell(Text(e.name)),
                                DataCell(Text(
                                  e.points.toString(),
                                ))
                              ]))
                          .toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                      child: Text(
                        'Vaivorykštes išleidai:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: spendings?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _challengeType(typeTitle: spendings![index]);
                        })
                  ],
                ),
              );
            }
          }),
    );
  }

  Future<RainbowBalance> getData() async {
    final DioClient dioClient = DioClient();
    final profileRaw = await dioClient.getItem('/api/results/balance/');
    return RainbowBalance.fromJson(profileRaw!);
  }
}

class _challengeType extends StatelessWidget {
  final Spending typeTitle;
  const _challengeType({
    Key? key,
    required this.typeTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        initiallyExpanded: false,
        title: Text(typeTitle.name,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .merge(const TextStyle(color: ThemeColors.neutralColor))),
        controlAffinity: ListTileControlAffinity.leading,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Kaina: ${typeTitle.price}'),
                SizedBox(width: 20),
                Text('Kiekis: ${typeTitle.amount}'),
                SizedBox(width: 20),
                Text('Viso: ${typeTitle.total}')
              ],
            ),
          )
        ]);
  }
}
