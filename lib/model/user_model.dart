class UserModel {
  String? uid;
  String? email;
  String? name;
  //String? password;
  UserModel({this.uid, this.email, this.name});

//data from server
  factory UserModel.frontMap(map) {
    return UserModel(
      uid: map('uid'),
      email: map('email'),
      name: map('name'),
    );
  }
  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}
