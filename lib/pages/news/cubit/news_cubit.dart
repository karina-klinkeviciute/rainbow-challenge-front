import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;
  Timer? _timer;
  NewsCubit({required this.newsRepository}) : super(NewsInitial());

  void fetchNews() {
    _timer = Timer(Duration(seconds: 1), () {
      if (!isClosed) {
        newsRepository.fetchNews().then((newsList) {
          if (!isClosed) {
            emit(NewsLoaded(newsList: newsList));
          }
        });
      }
    });
  }
  
  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
