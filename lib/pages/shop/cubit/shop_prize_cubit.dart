import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/available_prize/prize_class.dart';
import 'package:rainbow_challenge/utils/repository/joined_challenges/prize_repository.dart';

class ShopPrizeCubit extends Cubit<ShopPrizeState> {
  final PrizeRepository prizeRepository;
  ShopPrizeCubit({
    required this.prizeRepository,
  }) : super(ShopPrizeInitial());

  void fetchPrize() {
    Timer(Duration(seconds: 2), () {
      print('PrizeFetched');
      prizeRepository.fetchPrize().then((prizesList) {
        emit(ShopPrizeLoaded(prizesList: prizesList));
      });
    });
  }
}

abstract class ShopPrizeState extends Equatable {
  const ShopPrizeState();

  @override
  List<Object> get props => [];
}

class ShopPrizeInitial extends ShopPrizeState {}

class ShopPrizeLoaded extends ShopPrizeState {
  final List<Prize> prizesList;
  ShopPrizeLoaded({required this.prizesList});
}
