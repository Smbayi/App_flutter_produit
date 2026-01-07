import '../services/firestore_service.dart';
import '../models/product_model.dart';

class ProductController {
  final FirestoreService _firestore = FirestoreService();

  Future<void> addProduct(String name, String price) async {
    await _firestore.addProduct(name, price);
  }

  Stream<List<ProductModel>> getProducts() {
    return _firestore.getProducts();
  }
}
