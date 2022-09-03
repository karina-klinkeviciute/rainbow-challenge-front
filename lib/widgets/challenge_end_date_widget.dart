import 'package:flutter/material.dart';
import 'package:rainbow_challenge/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChallengeEndDateWidget extends StatelessWidget {
  final DateTime? endDate;
  const ChallengeEndDateWidget({Key? key, this.endDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (endDate != null) {
      final DateFormat formatter = DateFormat('yyyy MM dd');
      final String formattedDate = formatter.format(endDate!);
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month),
            SizedBox(width: 5),
            Text(AppLocalizations.of(context)!.action_challenge_end),
            SizedBox(
              width: 5,
            ),
            Text(formattedDate)
          ],
        ),
      );
    }
    return Container();
  }
}
