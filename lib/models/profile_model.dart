class Profile {
  String name;
  String emailId;
  String mobileNumber;

  /// constructor
  Profile({this.name, this.emailId, this.mobileNumber});

  /// fromMap
  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
    name: json['name'] == null ? null : json["name"],
    emailId: json['emailId'] == null ? null : json["emailId"],
    mobileNumber:
    json['mobileNumber'] == null ? null : json["mobileNumber"],
  );

  ///toMap()
  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "emailId": emailId == null ? null : emailId,
    "mobileNumber": mobileNumber == null ? null : mobileNumber,
  };
}