class GigModel {
  String uid;
  String name;
  String venue;
  String url;

  GigModel(
      {required this.uid,
        required this.name,
        required this.venue,
        required this.url,
      });

  GigModel.fromJson(Map<String, dynamic> json) :
        uid = json['uid'],
        name = json['name'],
        venue = json['venue'],
        url = json['url'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['venue'] = this.venue;
    data['url'] = this.url;
    return data;
  }
}
