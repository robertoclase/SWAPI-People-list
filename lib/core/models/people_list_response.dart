import 'dart:convert';

class PeopleListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PersonResult> results;

  PeopleListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PeopleListResponse.fromJson(String str) =>
      PeopleListResponse.fromMap(json.decode(str));

  factory PeopleListResponse.fromMap(Map<String, dynamic> json) =>
      PeopleListResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PersonResult>.from(
          json["results"].map((x) => PersonResult.fromMap(x)),
        ),
      );

  Map<String, dynamic> toMap() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toMap())),
  };
}

class PersonResult {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String url;

  PersonResult({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.url,
  });

  factory PersonResult.fromMap(Map<String, dynamic> json) => PersonResult(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: json["gender"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "height": height,
        "mass": mass,
        "hair_color": hairColor,
        "skin_color": skinColor,
        "eye_color": eyeColor,
        "birth_year": birthYear,
        "gender": gender,
        "url": url,
      };
}
