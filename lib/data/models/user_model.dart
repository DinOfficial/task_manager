class UserModel {
  final String id;
  final String email;
  final String firsName;
  final String lastName;
  final String mobile;

  UserModel({
    required this.id,
    required this.email,
    required this.firsName,
    required this.lastName,
    required this.mobile
  });


  factory UserModel.fromJson(Map<String, dynamic> jsonData){
    return UserModel(
        id: jsonData['_id'],
        email: jsonData['email'],
        firsName: jsonData['firstName'],
        lastName: jsonData['lastName'],
        mobile: jsonData['mobile']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "email": email,
      "firstName": firsName,
      "lastName": lastName,
      "mobile": mobile,
    };
  }
}