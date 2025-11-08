import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/available_prize/prize_class.dart';
import 'package:rainbow_challenge/utils/repository/joined_challenges/prize_repository.dart';

class ShopPrizeCubit extends Cubit<ShopPrizeState> {
  final PrizeRepository prizeRepository;
  Timer? _timer;
  ShopPrizeCubit({
    required this.prizeRepository,
  }) : super(ShopPrizeInitial());

  void fetchPrize() {
    _timer = Timer(Duration(seconds: 2), () {
      if (!isClosed) {
        print('PrizeFetched');
        prizeRepository.fetchPrize().then((prizesList) {
          if (!isClosed) {
            emit(ShopPrizeLoaded(prizesList: prizesList));
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
