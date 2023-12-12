class Brand {
  String image;
  Brand({required this.image});

  factory Brand.fromMap(Map<String, dynamic> data) {
    return Brand(image: data['image'] ?? "Gagal mengambil gambar");
  }
}
