// To parse this JSON data, do
//
//     final todosResponseModel = todosResponseModelFromJson(jsonString);

import 'dart:convert';

List<TodosResponseModel> todosResponseModelFromJson(String str) => List<TodosResponseModel>.from(json.decode(str).map((x) => TodosResponseModel.fromJson(x)));

String todosResponseModelToJson(List<TodosResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodosResponseModel {
    int userId;
    int id;
    String title;
    bool completed;

    TodosResponseModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    factory TodosResponseModel.fromJson(Map<String, dynamic> json) => TodosResponseModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}


class DivisionListByCountryIdResponseModel {
  final List<Division>? divisions;

  DivisionListByCountryIdResponseModel({required this.divisions});

  factory DivisionListByCountryIdResponseModel.fromJson(List<dynamic> jsonList) {
    List<Division> divisions = jsonList.map((json) => Division.fromJson(json)).toList();
    return DivisionListByCountryIdResponseModel(divisions: divisions);
  }
}
class Division {
  final String? divisionCode;
  final String? divisionName;

  Division({required this.divisionCode, required this.divisionName});

  factory Division.fromJson(Map<String, dynamic> json) {
    return Division(
      divisionCode: json['divisionCode'],
      divisionName: json['divisionName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'divisionCode': divisionCode,
      'divisionName': divisionName,
    };
  }
}
