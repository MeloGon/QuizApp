import 'dart:convert';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
  Quiz({
    this.idQuiz,
    this.tittleQuiz,
    this.urlQuiz,
    this.descQuiz,
  });

  String idQuiz;
  String tittleQuiz;
  String urlQuiz;
  String descQuiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        idQuiz: json["id_quiz"] == null ? null : json["id_quiz"],
        tittleQuiz: json["tittle_quiz"] == null ? null : json["tittle_quiz"],
        urlQuiz: json["url_quiz"] == null ? null : json["url_quiz"],
        descQuiz: json["desc_quiz"] == null ? null : json["desc_quiz"],
      );

  Map<String, dynamic> toJson() => {
        "id_quiz": idQuiz == null ? null : idQuiz,
        "tittle_quiz": tittleQuiz == null ? null : tittleQuiz,
        "url_quiz": urlQuiz == null ? null : urlQuiz,
        "desc_quiz": descQuiz == null ? null : descQuiz,
      };
}
