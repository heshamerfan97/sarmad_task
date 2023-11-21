import 'package:sarmad_task/utils/type_checker.dart';

class User{
  final String name, description, nationality, placeOfBirth;
  final int score;

  User({
    required this.name,
    required this.description,
    required this.nationality,
    required this.placeOfBirth,
    required this.score,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: TypeChecker.isString(json['name'])??"",
        description: TypeChecker.isString(json['description'])??"",
        nationality: TypeChecker.isString(json['nationality'])??"",
        placeOfBirth: TypeChecker.isString(json['placeOfBirth'])??"",
        score: TypeChecker.isInt(json['score'])??0,
      );



  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "nationality": nationality,
    "placeOfBirth": placeOfBirth,
    "score": score,
  };
}
