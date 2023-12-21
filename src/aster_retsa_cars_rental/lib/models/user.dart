class User {
  final String id;
  final String email;
  final String name;
  final String nik;
  final String sex;
  final String address;
  final String dateOfBirth;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.nik,
    required this.sex,
    required this.address,
    required this.dateOfBirth,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data['id'] ?? '',
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      nik: data['nik'] ?? '',
      sex: data['sex'] ?? '',
      address: data['address'] ?? '',
      dateOfBirth: data['dateOfBirth'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'nik': nik,
      'sex': sex,
      'address': address,
      'dateOfBirth': dateOfBirth,
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? nik,
    String? sex,
    String? address,
    String? dateOfBirth,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      nik: nik ?? this.nik,
      sex: sex ?? this.sex,
      address: address ?? this.address,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
