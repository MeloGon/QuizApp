// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

Question questionFromJson(String str) => Question.fromJson(json.decode(str));

String questionToJson(Question data) => json.encode(data.toJson());

class Question {
  Question(
      {this.idQuest,
      this.enunciate,
      this.correctOpt,
      this.firstOpt,
      this.secOpt,
      this.thirdOpt,
      this.fourthOpt});

  String idQuest;
  String enunciate;
  String correctOpt;
  String firstOpt;
  String secOpt;
  String thirdOpt;
  String fourthOpt;
  bool isSelected = false;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        idQuest: json["id_quest"] == null ? null : json["id_quest"],
        enunciate: json["enunciate"] == null ? null : json["enunciate"],
        firstOpt: json["first_opt"] == null ? null : json["first_opt"],
        secOpt: json["sec_opt"] == null ? null : json["sec_opt"],
        thirdOpt: json["third_opt"] == null ? null : json["third_opt"],
        fourthOpt: json["fourth_opt"] == null ? null : json["fourth_opt"],
      );

  Map<String, dynamic> toJson() => {
        "id_quest": idQuest == null ? null : idQuest,
        "enunciate": enunciate == null ? null : enunciate,
        "first_opt": firstOpt == null ? null : firstOpt,
        "sec_opt": secOpt == null ? null : secOpt,
        "third_opt": thirdOpt == null ? null : thirdOpt,
        "fourth_opt": fourthOpt == null ? null : fourthOpt,
      };
}
