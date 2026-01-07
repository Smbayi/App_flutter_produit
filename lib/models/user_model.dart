class UserModel {
  String email;

  UserModel({required this.email});

  Map<String, dynamic> toMap() {
    return {
      "email": email,
    };
  }
}
