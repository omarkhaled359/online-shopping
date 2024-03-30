class Customer {
  final int id;
  late final String name;
  final String firstName;
  final String lastName;
  late final String address;
  final String state;
  final String city;
  final String pinCode;
  final String email;
  final String password;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.state,
    required this.city,
    required this.pinCode,
    required this.email,
    required this.password,
  }) {
    name = '$firstName $lastName';
    address = '$state, $city, $pinCode';
  }

  // Factory constructor for creating Product from a Map
  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      state: map['state'],
      city: map['city'],
      pinCode: map['pinCode'],
      email: map['email'],
      password: map['password'],
    );
  }

  // Method to convert Product to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'state': state,
      'city': city,
      'pinCode': pinCode,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, address: $address, email: $email)';
  }
}