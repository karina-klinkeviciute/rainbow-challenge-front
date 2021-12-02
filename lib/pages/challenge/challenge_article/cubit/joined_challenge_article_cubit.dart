import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'joined_challenge_article_state.dart';

class JoinedChallengeArticleCubit extends Cubit<JoinedChallengeArticleState> {
  JoinedChallengeArticleCubit() : super(JoinedChallengeArticleInitial());
}
