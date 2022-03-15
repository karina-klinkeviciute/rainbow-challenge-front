import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rainbow_challenge/utils/model/models.dart';
import 'package:rainbow_challenge/utils/repository/repositories.dart';
import 'dart:async';
part 'regions_state.dart';

class RegionsCubit extends Cubit<RegionsState> {
  final RegionsRepository regionsRepository;
  RegionsCubit({required this.regionsRepository}) : super(RegionsInitial());

  void fetchRegions() {
    regionsRepository.fetchRegions().then((regionsList) {
      emit(RegionsLoaded(regionsList: regionsList));
    });
  }
}
