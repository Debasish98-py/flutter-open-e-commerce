import 'dart:convert';

Profile productFromMap(String str) => Profile.fromMap(json.decode(str));

String productToMap(Profile data) => json.encode(data.toMap());

class Profile {
  Profile({

    this.name,
    this.emailId,
    this.mobileNumber,
  });

  String name;
  String emailId;
  String mobileNumber;

  Profile copyWith({
    String name,
    String emailId,
    String mobileNumber,

  }) =>
      Profile(
        name: name ?? this.name,
        emailId: emailId ?? this.emailId,
        mobileNumber: mobileNumber ?? this.mobileNumber,
      );

  /// fromMap
  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
    name: json["name"] == null ? null : json["name"],
    emailId: json["emailId"] == null ? null : json["emailId"],
    mobileNumber: json["mobileNumber"] == null ? null : json["mobileNumber"],
  );

  ///toMap()
  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "emailId": emailId == null ? null : emailId,
    "mobileNumber": mobileNumber == null ? null : mobileNumber,
  };

}