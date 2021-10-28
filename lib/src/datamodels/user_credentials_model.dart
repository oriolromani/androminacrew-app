class UserCredentials {
  final int id;
  final String username;
  final String token;
  UserCredentials({this.id, this.username, this.token});

  UserCredentials.initial()
      : id = 0,
        username = '',
        token = '';

  UserCredentials.fake()
      : id = 2,
        username = 'urbez',
        token = 'ae86a597f7fb26a22e41d0265d003bbf94f4f247';

  UserCredentials.fromJson(Map<String, dynamic> json) :
        id = json['pk'],
        username = json['username'],
        token = json['token'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.id;
    data['username'] = this.username;
    return data;
  }
}