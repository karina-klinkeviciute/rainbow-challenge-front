import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  final ProfileRepository profileRepository;
  ProfileInfoCubit({required this.profileRepository})
      : super(ProfileInfoInitial());

  void fetchProfile() {
    Timer(Duration(seconds: 1), () {
      profileRepository.fetchProfile().then((profile) {
        emit(ProfileInfoLoaded(profile: profile));
      });
    });
  }
}

abstract class ProfileInfoState extends Equatable {
  const ProfileInfoState();

  @override
  List<Object> get props => [];
}

class ProfileInfoInitial extends ProfileInfoState {}

class ProfileInfoLoaded extends ProfileInfoState {
  final Profile profile;
  ProfileInfoLoaded({required this.profile});
}
