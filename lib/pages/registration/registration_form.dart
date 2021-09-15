import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';

class RegistrationForm extends StatefulWidget {
  @override
  State<RegistrationForm> createState() => _RegFormState();
}

class _RegFormState extends State<RegistrationForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  int _gender_value = 1;

  @override
  Widget build(BuildContext context) {
    _onRegButtonPressed() {
      BlocProvider.of<RegistrationBloc>(context).add(RegButtonPressed(
        email: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<RegistrationBloc, RegistrationState>(
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
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Lytis'),
                      controller: _passwordController,
                      obscureText: true,
                    ),

                    DropdownButton(
                        isExpanded: true,
                        value: _gender_value,
                        items: [
                          DropdownMenuItem(
                            child: Text("Vyras"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Moteris"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Translytis"),
                            value: 3,
                          )
                        ],
                        //onChanged: (int value) {
                          //setState(() {
                           // _gender_value = value;
                           // print(_gender_value);
                          //});
                        //},
                        hint:Text("Lytis")
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.width * 0.22,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: ElevatedButton(
                          onPressed: state is! LoginLoading
                              ? _onRegButtonPressed
                              : null,
                          child: Text(
                            'Registruotis',
                            style: TextStyle(
                              fontSize: 24.0,
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
