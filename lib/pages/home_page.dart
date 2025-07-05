import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Ne Vardı?')),
      body: ListView.builder(
        itemCount: provider.items.length,
        itemBuilder: (context, index) {
          final p = provider.items[index];
          return ListTile(
            title: Text(p.name),
            subtitle: Text('Miktar: ${p.quantity}  - SKT: ${p.expiry.toLocal()}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => provider.remove(p),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.add(Product('Elma', 1, DateTime.now().add(const Duration(days: 7))));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
