import 'date_model.dart';

class Task {
  //final int id;
  int id;
  String name;
  String start_time;
  String end_time;

  Task(
      {required this.id,
        required this.name,
        required this.start_time,
        required this.end_time});
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
        start_time = DateModel.formatDate(json['start_time']),
        end_time = DateModel.formatDate(json['end_time']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['start_time'] = this.start_time == null ? null : this.start_time.toString();
    data['end_time'] = this.end_time == null ? null : this.end_time.toString();
    return data;
  }
}