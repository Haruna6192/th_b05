class User {
  String? fullname;
  String? email;
  String? gender;
  String? favorite;

  User({
    this.fullname,
    this.email,
    this.gender,
    this.favorite,
  });
 User.fromJSON(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    gender = json['gender'];
    favorite = json['favorite'];
  }
  Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = {};
   data['fullname'] = fullname;
   data['email'] = email;
   data["gender"] = gender;
   data['favorite'] = favorite;
   return data;
}
}
