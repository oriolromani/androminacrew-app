import 'dart:convert';

class GigModel {
  String uid;
  String name;
  String venue;
  String url;
  List<String> tasks;

  GigModel(
      {required this.uid,
        required this.name,
        required this.venue,
        required this.url,
        required this.tasks,
      });

  GigModel.fromJson(Map<String, dynamic> json) :
        uid = json['uid'],
        name = json['name'],
        venue = json['venue'],
        url = json['url'],
        tasks = List<String>.from(json['tasks']);

 //(json['times'] as List).map((e) => TaskTimesModel.fromJson(e)).toList();


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['venue'] = this.venue;
    data['url'] = this.url;
    data['tasks'] = this.tasks;
    return data;
  }
}
