part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeModel model;

  HomeLoaded({@required this.model});
  @override
  List<Object> get props => [this.model];
}

class HomeError extends HomeState {
  final String errorMessage;
  HomeError({this.errorMessage});
  @override
  List<Object> get props => [this.errorMessage];
}
