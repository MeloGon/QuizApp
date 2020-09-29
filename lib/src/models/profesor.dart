import 'dart:convert';

Profesor profesorFromJson(String str) => Profesor.fromJson(json.decode(str));

String profesorToJson(Profesor data) => json.encode(data.toJson());

class Profesor {
  Profesor({
    this.idProfesor,
    this.emailProfesor,
    this.passProfesor,
  });

  String idProfesor;
  String emailProfesor;
  String passProfesor;

  factory Profesor.fromJson(Map<String, dynamic> json) => Profesor(
        idProfesor: json["id_profesor"],
        emailProfesor: json["email_profesor"],
        passProfesor: json["pass_profesor"],
      );

  Map<String, dynamic> toJson() => {
        "id_profesor": idProfesor,
        "email_profesor": emailProfesor,
        "pass_profesor": passProfesor,
      };
}
