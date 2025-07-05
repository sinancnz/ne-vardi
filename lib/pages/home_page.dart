import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import 'add_product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final df = DateFormat('dd MMM yyyy');
    return Scaffold(
      appBar: AppBar(title: const Text('Ne Vardı?')),
      body: provider.products.isEmpty
          ? const Center(child: Text('Henüz ürün eklemedin.'))
          : ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (context, index) {
                final product = provider.products[index];
                final daysLeft = product.expiry
                    .difference(DateTime.now())
                    .inDays;
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(product.name),
                    subtitle: Text(
                        'Miktar: ${product.quantity}\nSKT: ${df.format(product.expiry)}\n${daysLeft <= 3 ? "⚠️ Son ${daysLeft.abs()} gün!" : ""}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          provider.removeProduct(product.id),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AddProductPage())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
