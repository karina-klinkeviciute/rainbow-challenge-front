import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;
  NewsCubit({required this.newsRepository}) : super(NewsInitial());

  void fetchNews() {
    Timer(Duration(seconds: 1), () {
      newsRepository.fetchNews().then((newsList) {
        emit(NewsLoaded(newsList: newsList));
      });
    });
  }
}
