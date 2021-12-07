part of 'profile_info_cubit.dart';

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
