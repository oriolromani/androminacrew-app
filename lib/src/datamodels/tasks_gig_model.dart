class TasksGigModel {
  String uid;

  TasksGigModel(
      {required this.uid,
      });

  TasksGigModel.fromJson(Map<String, dynamic> json) :
        uid = json['uid'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;

    return data;
  }
}