import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow_challenge/pages/registration/bloc/reg_bloc.dart';
import 'package:rainbow_challenge/pages/registration/registration_form.dart';
import 'package:rainbow_challenge/utils/repository/regions_repository.dart';
import 'package:rainbow_challenge/utils/repository/user_repository.dart';

class RegistrationPage extends StatefulWidget {
  final UserRepository userRepository;
  final RegionsRepository regionsRepository;

  const RegistrationPage(
      {Key? key, required this.userRepository, required this.regionsRepository})
      : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState(
      userRepository: userRepository, regionsRepository: regionsRepository);
}

class _RegistrationPageState extends State<RegistrationPage> {
  final UserRepository userRepository;
  final RegionsRepository regionsRepository;

  _RegistrationPageState(
      {required this.userRepository, required this.regionsRepository});

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      child: BlocProvider(
        create: (_) => RegistrationBloc(userRepository: userRepository),
        child: RegistrationForm(),
      ),
    ));
  }

  Future<void> _loadData() async {
    var regionsList = await regionsRepository.fetchRegions();
  }
}
