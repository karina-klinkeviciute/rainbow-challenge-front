import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';

part 'profile_info_state.dart';

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
