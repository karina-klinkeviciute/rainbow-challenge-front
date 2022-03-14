import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/theme/colors.dart';
import 'cubit/regions_cubit.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO: Add styling
// TODO: Mark first three places differntly
// Limit regions to 10.
// AppBar show (with back button possibility)
class RegionsPage extends StatelessWidget {
  const RegionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RegionsCubit>(context).fetchRegions();
    return WrapperMainWidget(
      useAppBar: false,
      mainArea: _MainArea(),
      //  useAppBar: false,
    );
  }
}

class _MainArea extends StatelessWidget {
  _MainArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          HeadlineWidget(
            title: AppLocalizations.of(context)!.menu_regions,
          ),
          //    _LocalNavigation(),
          //  _AllChallenges(challenges: []),
          _Regions(),
          //  _ChallengesList()
        ],
      ),
    );
  }
}

class _Regions extends StatelessWidget {
  const _Regions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RegionsCubit>(context).fetchRegions();
    return BlocBuilder<RegionsCubit, RegionsState>(builder: (context, state) {
      if (!(state is RegionsLoaded))
        return Center(child: CircularProgressIndicator());
      final regionsList = (state).regionsList;
      final bestRegionsList = regionsList.sublist(0, 10);
      return ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: ThemeColors.neutralColorLight,
              ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bestRegionsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              horizontalTitleGap: 0,
              leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text((index + 1).toString(),
                        style: _textStyle(index, context)),
                  ]),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(bestRegionsList[index].name,
                          style: _textStyle(index, context)),
                    ),
                    SizedBox(width: 10),
                    Text(
                      bestRegionsList[index].points.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .merge(TextStyle(color: _color(index))),
                    ),
                  ]),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            );
          });
    });
  }
}

Color _color(int index) {
  switch (index) {
    case 0:
      {
        return ThemeColors.primaryColorDark;
      }

    case 1:
      {
        return ThemeColors.primaryColor;
      }

    case 2:
      {
        return ThemeColors.primaryColorLight;
      }

    default:
      {
        return ThemeColors.neutralColorLight;
      }
  }
}

TextStyle _textStyle(int index, context) {
  return Theme.of(context)
      .textTheme
      .headline5!
      .merge(TextStyle(color: _color(index)));
}
