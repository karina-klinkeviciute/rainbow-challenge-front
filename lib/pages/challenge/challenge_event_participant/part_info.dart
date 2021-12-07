part of "challenge_event_participant_page.dart";

Widget _challengeInfo =
    BlocBuilder<ChallengeEventParticipantCubit, ChallengeEventParticipantState>(
  builder: (context, state) {
    if (!(state is ChallengeEventParticipantLoaded))
      return Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: CircularProgressIndicator(),
      ));
    final challengeTypeItem = (state).challengeTypeItem;

    bool canBeJoined = challengeTypeItem.main_challenge.can_be_joined;

    return Column(children: [
      ChallengeHeadlineWidget(
        title: challengeTypeItem.main_challenge.name,
        points: challengeTypeItem.main_challenge.points,
      ),
      ChallengeDescriptionWidget(
          description: challengeTypeItem.main_challenge.description),
      //_challengeFormMain()
    ]);
  },
);

// Add a link to QR scanner
Widget _challengeFormMain(context, String uuid) {
  return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            // Add arguments
            MaterialPageRoute(
                builder: (context) => QrCodeScannerPage(
                      uuid: uuid,
                    )));
      },
      icon: Icon(ThemeIcons.qrCode),
      label: Text(
          AppLocalizations.of(context)!.joined_challenge_event_field_qr_code));
}
