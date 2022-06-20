class Loginmodel {
  late bool status;
  late String message;
  Userdata? data;

  Loginmodel.fromjson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] != null ? Userdata.fromjson(json["data"]) : null;
  }
}

class Userdata {
  late int id;
  late String name;
  late String email;
  late int phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  Userdata.fromjson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["phone"];
    image = json["image"];
    points = json["points"];
    credit = json["credit"];
    token = json["token"];
  }
}
