import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: regionsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(regionsList[index].name),
              subtitle: Text(regionsList[index].points.toString()),
            );
          });
    });
  }
}
