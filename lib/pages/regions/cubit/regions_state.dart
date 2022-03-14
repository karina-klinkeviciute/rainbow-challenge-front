part of 'regions_cubit.dart';

abstract class RegionsState extends Equatable {
  const RegionsState();

  @override
  List<Object> get props => [];
}

class RegionsInitial extends RegionsState {}

class RegionsLoaded extends RegionsState {
  final List<RegionModel> regionsList;
  RegionsLoaded({required this.regionsList});
}
