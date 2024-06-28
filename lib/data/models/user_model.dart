import 'package:dio/dio.dart' as dio;

class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? image;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    this.password,
    this.image,
  });

  Map<String?, dynamic> toJson() {
    return {
      "full_name": name,
      "phone_number": phone,
      "email": email,
      "password": password,
      "image": image,
    };
  }

  UserModel.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['full_name'];
    email = json['email'];
    phone = json['phone_number'];
    image = json['image'];
  }

  Future<Map<String, dynamic>> updateUsertoJson() async {
    return {
      if (name != null) "full_name": name,
      if (phone != null) "phone_number": phone,
      if (email != null) "email": email,
      if (image != null) "image": await dio.MultipartFile.fromFile(image!)
      // "password": password,
      // if (image != null) "image": image,
    };
  }
}
