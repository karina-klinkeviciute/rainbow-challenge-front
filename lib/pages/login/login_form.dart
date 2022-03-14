import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/login/bloc/login_bloc.dart';
import 'package:rainbow_challenge/pages/pages.dart';
import 'package:rainbow_challenge/pages/registration/registration_page.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';

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
          Scaffold.of(context).showSnackBar(SnackBar(
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
          return Container(
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'El. paštas', icon: Icon(Icons.person)),
                      controller: _usernameController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Slaptažodis', icon: Icon(Icons.security)),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.width * 0.22,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: RaisedButton(
                          onPressed: state is! LoginLoading
                              ? _onLoginButtonPressed
                              : null,
                          child: Text(
                            'Prisijungti',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: state is LoginLoading
                          ? CircularProgressIndicator()
                          : null,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationPage(
                                          userRepository: UserRepository(),
                                        )));
                          },
                          child: const Text(
                              'Neturi paskyros? Registruokis'), //TODO add localizations
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
