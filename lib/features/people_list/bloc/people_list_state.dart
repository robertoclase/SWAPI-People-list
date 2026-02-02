part of 'people_list_bloc.dart';

@immutable
sealed class PeopleListState {}

final class PeopleListInitial extends PeopleListState {}

final class PeopleListLoading extends PeopleListState {}

final class PeopleListSuccess extends PeopleListState {
  final List<PersonResult> peopleList;
  PeopleListSuccess({required this.peopleList});
}

final class PeopleListError extends PeopleListState {
  final String message;

  PeopleListError({required this.message});
}
