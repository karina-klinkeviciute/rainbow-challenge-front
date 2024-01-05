import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/bloc/authentication_bloc.dart';
import 'package:rainbow_challenge/pages/news/news_page.dart';
import 'package:rainbow_challenge/social_signin_config.dart';

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
        return _GoogleButton(onAuthCode: onAuthCode, onError: onError);
    }
  }

  void onAuthCode(String token) async {
    AuthenticationBloc authBloc = BlocProvider.of<AuthenticationBloc>(context);

    try {
      final user = await authBloc.userRepository.authenticateSocial(type: widget.type, authCode: token);
      authBloc.add(LoggedIn(user: user));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewsPage()));
    } catch (e) {
      onError(e);
    }
  }

  void onError(Object error) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(AppLocalizations.of(context)!.social_sign_in_failed(widget.type.displayName)),
      backgroundColor: Colors.red,
    ));
  }

}

abstract class _SocialLoginButton extends StatelessWidget {
  final ValueSetter<Object> onError;
  final ValueSetter<String> onAuthCode;

  const _SocialLoginButton({Key? key, required this.onAuthCode, required this.onError}) : super(key: key);
}

class _GoogleButton extends _SocialLoginButton {
  _GoogleButton({required super.onAuthCode, required super.onError});

  void _handleSignIn() async {
    var scopes = [
      "email",
    ];

    GoogleSignIn? googleSignIn = null;
    if (Platform.isAndroid) {
      googleSignIn = GoogleSignIn(scopes: scopes);
    } else if (Platform.isIOS) {
      googleSignIn = GoogleSignIn(
          clientId: SignInConfig.GOOGLE_IOS_CLIENT_ID,
          serverClientId: SignInConfig.GOOGLE_SERVER_CLIENT_ID,
          scopes: scopes
      );
    }

    try {
      if (googleSignIn != null) {
        final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
        if (googleAccount == null) {
          throw new Exception("Google Account not available");
        }

        var auth = await googleAccount.authentication;
        if (auth.idToken != null) {
          onAuthCode(auth.idToken!);
        } else {
          throw new Exception("Google Authentication not available");
        }
      }
    } catch (error) {
      onError(error);
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