import 'package:backb/bloc/home_api.dart';
import 'package:backb/model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try {
      if (event is GetHomeData) {
        yield HomeLoading();
        HomeModel model = await HomeApi().getHome();
        if (model == null) {
          yield HomeError(errorMessage: "Model is empty");
        } else {
          yield HomeLoaded(model: model);
        }
      }
    } catch (e) {
      yield HomeError(errorMessage: e.toString());
    }
  }
}
