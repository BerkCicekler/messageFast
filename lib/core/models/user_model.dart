import 'dart:convert';

class UserModel {
  final String uId;
  final String email;
  final String name;
  final String userName;
  final String profilePictureURL;
  final String notificationToken;

  UserModel({
    required this.uId,
    required this.email,
    required this.name,
    required this.userName,
    required this.profilePictureURL,
    required this.notificationToken
  });

  UserModel copyWith({
    String? uId,
    String? email,
    String? name,
    String? userName,
    String? profilePictureURL,
    String? notificationToken
  }) {
    return UserModel(
      uId: uId ?? this.uId,
      email: email ?? this.email,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      profilePictureURL: profilePictureURL ?? this.profilePictureURL,
      notificationToken: notificationToken ?? this.notificationToken
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'uId': uId});
    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'userName': userName});
    result.addAll({'profilePictureURL': profilePictureURL});
    result.addAll({'notification': notificationToken});
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uId: map['uId'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      userName: map['userName'] ?? '',
      profilePictureURL: map['profilePictureURL'] ?? '',
      notificationToken: map['notificationToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object user) {
    return user is UserModel && user.uId == uId;
  }  

  factory UserModel.empty(){
    return UserModel(uId: "", email: "", name: "", userName: "", profilePictureURL: "", notificationToken: "");
  }

}
