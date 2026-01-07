import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class FirestoreService {
  final CollectionReference products =
      FirebaseFirestore.instance.collection("produits");

  // Ajouter un produit (sans image pour l'instant)
  Future<void> addProduct(String name, String price, {String? image}) async {
    await products.add({
      "name": name,
      "price": price,
      "image": image, // optionnel
    });
  }

  // Récupérer les produits en temps réel
  Stream<List<ProductModel>> getProducts() {
    return products.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
