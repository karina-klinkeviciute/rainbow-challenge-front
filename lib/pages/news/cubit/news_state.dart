part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> newsList;
  NewsLoaded({required this.newsList});
}
