class User {
  final String name;
  final String nik;
  final String sex;
  final String address;
  final String dateOfBirth;

  User({
    required this.name,
    required this.nik,
    required this.sex,
    required this.address,
    required this.dateOfBirth,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      name: data['fullName'] ?? "Gagal mengambil nama",
      nik: data['nik'] ?? "Gagal mengambil nik",
      sex: data['sex'] ?? "Gagal mengambil jenis kelamin",
      address: data['address'] ?? "Gagal mengambil alamat",
      dateOfBirth: data['birth'] ?? "Gagal mengambil tanggal ",
    );
  }
}
