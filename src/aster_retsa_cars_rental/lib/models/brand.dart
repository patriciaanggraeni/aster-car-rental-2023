class Brand {
  String brand;
  String image;

  Brand({
    required this.brand,
    required this.image,
  });

  factory Brand.fromMap(Map<String, dynamic> data) {
    return Brand (
      brand: data['brand'] ?? "Gagal mengambil brand",
      image: data['image'] ?? "Gagal mengambil gambar",
    );
  }
}
