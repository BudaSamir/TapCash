class User {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? token;
  // String? renewalToken;
  // bool? onboardingSeen;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.token,
    // this.renewalToken,
  });

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      firstName: responseData['user']['firstName'],
      lastName: responseData['user']['lastName'],
      email: responseData['user']['email'],
      phone: responseData['user']['phone'],
      password: responseData['user']['password'],
      token: responseData['user']['token'],
    );
    // renewalToken: responseData['renewalToken']);
  }
}
