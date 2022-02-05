import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_smait/models/models.dart';
import 'package:flutter_project_smait/repositories/home_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc(this._homeRepository) : super(const HomeState()) {
    on<LoadingCharacterEvent>(_loadContent);
  }

  Future<void> _loadContent(
      LoadingCharacterEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeOverviewStatus: HomeStatus.loading));

    try {
      List<Character> listOfCharacters =
          Character.toList(await _homeRepository.fetchApi());

      emit(state.copyWith(
          homeOverviewStatus: HomeStatus.success,
          listOfCharacter: listOfCharacters));
    } on Exception catch (error) {
      addError(error);
      emit(state.copyWith(homeOverviewStatus: HomeStatus.failure));
    }
  }
}
