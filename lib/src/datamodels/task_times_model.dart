class TaskTimesModel {
  int id;
  String start_time;
  String end_time;

  TaskTimesModel(
      {required this.id,
        required this.start_time,
        required this.end_time,
      });

  TaskTimesModel.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        start_time = json['start_time'],
        end_time = json['end_time'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_time'] = this.start_time;
    data['end_time'] = this.end_time;
    return data;
  }
}
