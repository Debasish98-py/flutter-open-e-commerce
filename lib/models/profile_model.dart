import 'dart:convert';

Profile productFromMap(String str) => Profile.fromMap(json.decode(str));

String productToMap(Profile data) => json.encode(data.toMap());

class Profile {
  Profile({
    this.name,
    this.emailId,
    this.mobileNumber,
    this.landmark,
    this.addressLine,
    this.phoneNumber,
    this.city,
    this.state,
    this.pin,
  });

  String name;
  String emailId;
  String mobileNumber;
  String landmark;
  String addressLine;
  String phoneNumber;
  String city;
  String state;
  String pin;

  Profile copyWith({
    String name,
    String emailId,
    String mobileNumber,
    String landmark,
    String addressLine,
    String phoneNumber,
    String city,
    String state,
    String pin,
  }) =>
      Profile(
        name: name ?? this.name,
        emailId: emailId ?? this.emailId,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        landmark: landmark ?? this.landmark,
        addressLine: addressLine ?? this.addressLine,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        city: city ?? this.city,
        state: state ?? this.state,
        pin: pin ?? this.pin,
      );

  /// fromMap
  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        name: json["name"] == null ? null : json["name"],
        emailId: json["emailId"] == null ? null : json["emailId"],
        mobileNumber:
            json["mobileNumber"] == null ? null : json["mobileNumber"],
        landmark: json["landmark"] == null ? null : json["landmark"],
        addressLine: json["addressLine"] == null ? null : json["addressLine"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        pin: json["pin"] == null ? null : json["pin"],
      );

  ///toMap()
  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "emailId": emailId == null ? null : emailId,
        "mobileNumber": mobileNumber == null ? null : mobileNumber,
        "landmark": landmark == null ? null : landmark,
        "addressLine": addressLine == null ? null : addressLine,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "pin": pin == null ? null : pin,
      };
}
