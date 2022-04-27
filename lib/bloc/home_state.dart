part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<PersonActivity> persons;
  const HomeLoadedState({required this.persons});

  @override
  List<Object> get props => [persons];
}
