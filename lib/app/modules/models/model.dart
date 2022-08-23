class Usermodel {
  String? id;
  String? uid;
  final String? uname;
  final String? email;

  Usermodel({this.uid, this.uname, this.email, this.id = ""});

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "user_name": uname,
        "email": email,
      };

  static Usermodel fromJson(Map<String, dynamic> json) => Usermodel(
        id: json["id"],
        uid: json["uid"],
        uname: json["user_name"],
        email: json["email"],
      );
}
