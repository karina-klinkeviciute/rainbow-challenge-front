import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rainbow_challenge/pages/news/news_page.dart';

import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SocialLoginWidgetType {
  google("google", "Google");

  const SocialLoginWidgetType(this.name, this.displayName);
  final String name;
  final String displayName;
}

class SocialLoginWidget extends StatefulWidget {
  final SocialLoginWidgetType type;

  const SocialLoginWidget({Key? key, required this.type}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SocialLoginWidgetState();
  }
}

class _SocialLoginWidgetState extends State<SocialLoginWidget> {

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case SocialLoginWidgetType.google:
        return _GoogleButton(onAuthToken: onAuthToken, onError: onError);
    }
  }

  void onAuthToken(String token) {
    //FIXME authenticate with API first and start app session before calling this
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewsPage()));
  }

  void onError() {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(AppLocalizations.of(context)!.social_sign_in_failed(widget.type.displayName)),
      backgroundColor: Colors.red,
    ));
  }

}

abstract class _SocialLoginButton extends StatelessWidget {
  final VoidCallback onError;
  final ValueSetter<String> onAuthToken;

  const _SocialLoginButton({Key? key, required this.onAuthToken, required this.onError}) : super(key: key);
}

class _GoogleButton extends _SocialLoginButton {
  _GoogleButton({required super.onAuthToken, required super.onError});

  void _handleSignIn() async {
    var scopes = [
      "email",
    ];

    GoogleSignIn? googleSignIn = null;
    if (Platform.isAndroid) {
      googleSignIn = GoogleSignIn(scopes: scopes);
    } else if (Platform.isIOS) {
      googleSignIn = GoogleSignIn(
          clientId: "",
          serverClientId: "",
          scopes: scopes
      );
    }

    try {
      if (googleSignIn != null) {
        final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

        if (googleAccount != null && googleAccount.serverAuthCode != null) {
          onAuthToken(googleAccount.serverAuthCode!);
        } else {
          throw new Exception("Google Account not available");
        }
      }
    } catch (error) {
      onError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.google,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.all(3),
      text: AppLocalizations.of(context)!.sign_in_with_google,
      onPressed: () {
        _handleSignIn();
      },
    );
  }
}