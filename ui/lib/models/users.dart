class User {
  int userId, phoneNumber;
  String userName, firstName, lastName, middleName, imageUrl;

  User({
    this.userId,
    this.phoneNumber,
    this.userName,
    this.firstName,
    this.lastName,
    this.middleName,
    this.imageUrl,
  });

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      userId: json["userId"],
      phoneNumber: json["phoneNumber"],
      userName: json["userName"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      middleName: json["middleName"],
      imageUrl: json["imageUrl"],
    );
  }
}
