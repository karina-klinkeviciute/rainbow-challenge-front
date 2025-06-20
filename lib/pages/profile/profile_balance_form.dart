import 'package:flutter/material.dart';
import 'package:rainbow_challenge/services/dio_client.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'package:rainbow_challenge/utils/model/available_prize/prize_class.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:rainbow_challenge/localization/app_localizations.dart'; 

class ProfileRainbowForm extends StatelessWidget {
  ProfileRainbowForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WrapperMainWidget(
      useAppBar: false,
      index: 1,
      mainArea: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            HeadlineWidget(title: AppLocalizations.of(context)!.rainbows),
            FutureBuilder<RainbowBalance>(
                future: getData(),
                builder: (context, AsyncSnapshot<RainbowBalance> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    var _earnings = snapshot.data?.earning;
                    var _spendings = snapshot.data?.spending;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            '${AppLocalizations.of(context)!.rainbows_received}:      ${snapshot.data!.earnedRainbows.toString()}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            '${AppLocalizations.of(context)!.rainbows_active}:  ${snapshot.data!.remainingRainbows.toString()}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                          child: Text(
                            AppLocalizations.of(context)!.rainbows_received_for_tasks,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataTable(
                          border: TableBorder.all(
                              borderRadius: BorderRadius.circular(20)),
                          columns: [
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.challenge_name,
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                                label: Expanded(
                              child: ImageLocalWidget(
                                url: 'assets/images/rainbow.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                            ))
                          ],
                          rows: _earnings!
                              .map((e) => DataRow(cells: [
                                    DataCell(
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(e.name,
                                                  softWrap: false,
                                                  overflow: TextOverflow.clip),
                                            ),
                                            Icon(
                                              Icons.chevron_right_outlined,
                                              color: ThemeColors.secondaryColor
                                                  .withOpacity(0.7),
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                        onTap: (() => showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0))),
                                                  content: Text(e.name),
                                                )))),
                                    DataCell(Text(e.points.toString()))
                                  ]))
                              .toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                          child: Text(
                            AppLocalizations.of(context)!.rainbows_spent_on,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _spendings?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _challengeType(
                                  typeTitle: _spendings![index]);
                            })
                      ],
                    );
                  }
                }),
          ],
        ),
      ),
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
        collapsedIconColor: ThemeColors.secondaryColor,
        iconColor: ThemeColors.secondaryColor,
        initiallyExpanded: false,
        title: Text(typeTitle.name,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .merge(const TextStyle(color: ThemeColors.neutralColor))),
        controlAffinity: ListTileControlAffinity.leading,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${AppLocalizations.of(context)!.price}: ${typeTitle.price}'),
                SizedBox(width: 20),
                Text('${AppLocalizations.of(context)!.amount}: ${typeTitle.amount}'),
                SizedBox(width: 20),
                Text('${AppLocalizations.of(context)!.total}: ${typeTitle.total}')
              ],
            ),
          )
        ]);
  }
}
