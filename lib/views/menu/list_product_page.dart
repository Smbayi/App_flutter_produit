import 'package:flutter/material.dart';
import '../../controllers/product_controller.dart';
import '../../models/product_model.dart';

class ListProductPage extends StatelessWidget {
  final ProductController controller = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text("Liste des produits"),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: controller.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.orangeAccent),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "Aucun produit trouvé",
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            );
          }

          final products = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                color: Colors.blueGrey[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: (product.image != null && product.image!.isNotEmpty)
                      ? Image.network(
                          product.image!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.shopping_bag,
                          color: Colors.orangeAccent,
                          size: 50,
                        ),
                  title: Text(
                    product.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  subtitle: Text(
                    "Prix : ${product.price}",
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
