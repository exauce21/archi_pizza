class User {
  final String image;
  final String firstname;
  final String lastname;
  final String email;
  final int phone;
  final String address;
  final String paymentMethod;

  const User({
    required this.image,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.address,
    required this.paymentMethod,
  });
}