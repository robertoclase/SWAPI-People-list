import 'package:swapi_people_list/core/models/people_list_response.dart';

abstract class PeopleInterface {
  Future<List<PersonResult>> getAllPeople();
  Future<PersonResult> getOnePerson(String id);
}
