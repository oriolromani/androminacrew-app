
class User {
  //final int id;
  final String username;
  final String first_name;
  final String last_name;
  final String email;
  final String uid;

  User({required this.username, required this.first_name, required this.last_name, required this.email, required this.uid});

  User.initial() :
        username = '',
        first_name = '',
        last_name = '',
        email = '',
        uid = '';

  User.fromJson(Map<String, dynamic> json) :
        username = json['username'],
        first_name = json['username'],
        last_name = json['first_name'],
        email = json['email'],
        uid = json['uid'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['email'] = email;
    data['uid'] = uid;
    return data;
  }
}