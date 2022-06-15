import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

class ShopInfoCubit extends Cubit<ShopInfoState> {
  final ProfileRepository profileRepository;
  ShopInfoCubit({required this.profileRepository}) : super(ShopInfoInitial());

  void fetchProfile() {
    Timer(Duration(seconds: 1), () {
      profileRepository.fetchProfile().then((profile) {
        emit(ShopInfoLoaded(profile: profile));
      });
    });
  }
}

abstract class ShopInfoState extends Equatable {
  const ShopInfoState();

  @override
  List<Object> get props => [];
}

class ShopInfoInitial extends ShopInfoState {}

class ShopInfoLoaded extends ShopInfoState {
  final Profile profile;
  ShopInfoLoaded({required this.profile});
}
