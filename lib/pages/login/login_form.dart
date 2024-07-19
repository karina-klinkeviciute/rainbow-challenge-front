import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/login/bloc/login_bloc.dart';
import 'package:rainbow_challenge/pages/login/recovery_page.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';
import 'package:rainbow_challenge/widgets/language_widget.dart';
import 'package:rainbow_challenge/widgets/social_login_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
        email: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        } else if (state is LoginSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => NewsPage()));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              child: Form(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 100, 40, 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.email, icon: Icon(Icons.person)),
                        controller: _usernameController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.password,
                            icon: Icon(Icons.security)),
                        controller: _passwordController,
                        obscureText: true,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.width * 0.22,
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: ElevatedButton(
                            onPressed: state is! LoginLoading
                                ? _onLoginButtonPressed
                                : null,
                            child: Text(
                              AppLocalizations.of(context)!.action_login,
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: SocialLoginWidget(type: SocialLoginWidgetType.google),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: SocialLoginWidget(type: SocialLoginWidgetType.apple),
                        ),
                      ),
                      Container(
                        child: state is LoginLoading
                            ? CircularProgressIndicator()
                            : null,
                      ),
                      Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegistrationPage(
                                                  userRepository:
                                                      UserRepository(),
                                                )));
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.action_register,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RecoveryPage(
                                                  userRepository:
                                                      UserRepository(),
                                                )));
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.action_forgot_password,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                LanguageWidget(),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
