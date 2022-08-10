class User {
  int userId, phoneNumber;
  String userName, firstName, email, lastName, middleName, imageUrl;

  User({
    this.userId,
    this.phoneNumber,
    this.userName,
    this.email,
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
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      middleName: json["middleName"],
      imageUrl: json["imageUrl"],
    );
  }
}
