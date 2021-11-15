import 'date_model.dart';

class Task {
  //final int id;
  int id;
  String name;
  String start_date;
  String company;
  String status;

  Task(
      {required this.id,
        required this.name,
        required this.start_date,
        required this.company,
        required this.status});
/*
  Task.initial() :
        id = 0,
        name = '',
        start_date = DateModel(dateTime: DateTime.now()),
        end_date = DateModel(dateTime: DateTime.now());
*/
  Task.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        start_date = DateModel.formatDate(json['start_date']),
        company = json['company'],
        status = json['status'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['start_date'] = this.start_date == null ? null : this.start_date.toString();
    data['company'] = this.company;
    data['status'] = this.status;
    return data;
  }
}