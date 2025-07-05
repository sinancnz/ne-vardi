import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _qtyController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd MMM yyyy');
    return Scaffold(
      appBar: AppBar(title: const Text('Ürün Ekle')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Ürün adı'),
                validator: (v) => v == null || v.isEmpty ? 'Gerekli' : null,
              ),
              TextFormField(
                controller: _qtyController,
                decoration: const InputDecoration(labelText: 'Miktar'),
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || int.tryParse(v) == null ? 'Geçersiz' : null,
              ),
              const SizedBox(height: 12),
              ListTile(
                title: Text(_selectedDate == null
                    ? 'Son kullanma tarihi seç'
                    : 'SKT: ${df.format(_selectedDate!)}'),
                trailing: const Icon(Icons.calendar_month),
                onTap: () async {
                  final now = DateTime.now();
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: now.subtract(const Duration(days: 1)),
                    lastDate: now.add(const Duration(days: 1825)),
                  );
                  if (picked != null) setState(() => _selectedDate = picked);
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _selectedDate != null) {
                    Provider.of<ProductProvider>(context, listen: false)
                        .addProduct(
                            _nameController.text.trim(),
                            int.parse(_qtyController.text),
                            _selectedDate!);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Kaydet'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
