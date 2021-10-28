class Task {
  //final int id;
  final int id;
  final String name;
  final DateTime start_date;
  final DateTime end_date;

  Task({required this.id, required this.name, required this.start_date, required this.end_date});

  Task.initial() :
        id = 0,
        name = '',
        start_date = DateTime.now(),
        end_date = DateTime.now();

  Task.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        start_date = json['start_date'],
        end_date = json['end_date'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['start_date'] = this.start_date;
    data['end_date'] = this.end_date;
    return data;
  }
}