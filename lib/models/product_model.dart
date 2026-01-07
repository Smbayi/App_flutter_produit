class ProductModel {
  final String id;       // ID du document Firestore
  final String name;
  final String price;
  final String? image;   // nullable, peut être vide

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.image,
  });

  // Crée un produit à partir des données Firestore
  factory ProductModel.fromMap(String id, Map<String, dynamic> data) {
    return ProductModel(
      id: id,
      name: data['name'] ?? '',
      price: data['price'] ?? '',
      image: data['image'], // peut être null
    );
  }

  // Convertir vers Map pour envoyer vers Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }
}
