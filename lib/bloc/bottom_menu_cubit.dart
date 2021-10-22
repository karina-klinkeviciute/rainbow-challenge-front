import 'package:flutter_bloc/flutter_bloc.dart';

class BottomMenuCubit extends Cubit<int> {
  BottomMenuCubit() : super(0);

  // update index function to update the index onTap in BottomNavigationBar
  void updateIndex(int index) => emit(index);

  // for navigation button on single page
  void getHome() => emit(0);
  void getProfile() => emit(1);
  void getChallenges() => emit(2);
  void getRegions() => emit(3);
  void getNavigation() => emit(4);
}
