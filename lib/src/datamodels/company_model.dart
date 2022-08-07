class CompanyModel {
  String uid;
  String name;
  String user;

  CompanyModel(
      {required this.uid,
        required this.name,
        required this.user,
      });

  CompanyModel.fromJson(Map<String, dynamic> json) :
        uid = json['uid'],
        name = json['name'],
        user = json['user'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['user'] = this.user;
    return data;
  }
}
