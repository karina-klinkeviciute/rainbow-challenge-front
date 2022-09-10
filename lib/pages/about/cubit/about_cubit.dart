import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

class AboutCubit extends Cubit<AboutState> {
  final TextsRepository textsRepository;
  AboutCubit({required this.textsRepository}) : super(AboutInitial());

  void fetchText(String uuid) {
    Timer(Duration(seconds: 0), () {
      textsRepository.fetchText(uuid).then((text) {
        emit(AboutLoaded(text: text));
      });
    });
  }
}

abstract class AboutState extends Equatable {
  const AboutState();

  @override
  List<Object> get props => [];
}

class AboutInitial extends AboutState {}

class AboutLoaded extends AboutState {
  final TextModel text;
  AboutLoaded({required this.text});
}
