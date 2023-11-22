import 'package:sarmad_task/utils/type_checker.dart';

class User{
  final String name, description, nationality, placeOfBirth;
  final String? image;
  final int score;

  User({
    required this.name,
    required this.description,
    required this.nationality,
    required this.placeOfBirth,
    this.image,
    required this.score,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final _description = ((json['descriptions'] as List<dynamic>?)??[]);
    final _countries = ((json['countries'] as List<dynamic>?)??[]);
    final imagesList = json['image_urls'] as List<dynamic>?;
    return User(
      name: TypeChecker.isString(json['name'])??"",
      description: _description.isEmpty?"":"${_description[0]['description1']}, ${_description[0]['description2']}",
      nationality: TypeChecker.isString(json['nat'])??"Unknown",
      placeOfBirth: _countries.firstWhere((country) => country['type'] == "Citizenship", orElse: () => {
        "name": "Unknown",
      })['name'],
      image: imagesList?.firstOrNull?.toString(),
      score: TypeChecker.isInt(json['score'])??0,
    );
  }



  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "nationality": nationality,
    "placeOfBirth": placeOfBirth,
    "score": score,
  };
}
