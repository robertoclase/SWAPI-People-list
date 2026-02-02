import 'package:flutter/material.dart';
import 'package:swapi_people_list/core/models/people_list_response.dart';
import 'package:swapi_people_list/core/services/people_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'people_list_event.dart';
part 'people_list_state.dart';

class PeopleListBloc extends Bloc<PeopleListEvent, PeopleListState> {
  PeopleListBloc(PeopleService peopleService) : super(PeopleListInitial()) {
    on<PeopleListFetchAllEvent>((event, emit) async {
      emit(PeopleListLoading());
      try {
        var apiPeopleList = await peopleService.getAllPeople();
        emit(PeopleListSuccess(peopleList: apiPeopleList));
      } catch (e) {
        emit(PeopleListError(message: e.toString()));
      }
    });
  }
}
