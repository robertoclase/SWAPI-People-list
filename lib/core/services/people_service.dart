import 'package:swapi_people_list/core/interfaces/people_interface.dart';
import 'package:swapi_people_list/core/models/people_list_response.dart';
import 'package:http/http.dart' as http;

class PeopleService implements PeopleInterface {
  final String _apiBaseUrl = "https://swapi.dev/api/people";

  @override
  Future<List<PersonResult>> getAllPeople() async {
    var url = Uri.parse(_apiBaseUrl);
    try {
      var response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var peopleListResponse = PeopleListResponse.fromJson(response.body);
        return peopleListResponse.results;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<PersonResult> getOnePerson(String id) {
    throw UnimplementedError();
  }
}
