import 'package:flutter/material.dart';
import '../../controllers/product_controller.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final ProductController controller = ProductController();

  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajouter produit")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Nom"),
            ),

            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: "Prix"),
            ),

            ElevatedButton(
              onPressed: () async {
                await controller.addProduct(
                    nameController.text,
                    priceController.text);

                Navigator.pop(context);
              },
              child: Text("Enregistrer"),
            )
          ],
        ),
      ),
    );
  }
}
