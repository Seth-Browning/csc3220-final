import 'package:csc322_starter_app/db_helpers/items.dart';
import 'package:flutter/material.dart';

class AddGroceryItemBottom extends StatefulWidget {
  AddGroceryItemBottom({super.key, required this.sheetContext});

  BuildContext sheetContext;

  @override
  State<AddGroceryItemBottom> createState() => _AddGroceryItemBottomState();
}

class _AddGroceryItemBottomState extends State<AddGroceryItemBottom> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _quantityController = TextEditingController();

  final _unitController = TextEditingController();

  late final BuildContext _sheetContext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _sheetContext = widget.sheetContext;
  }

  @override
  void dispose() {

    _nameController.dispose();
    _quantityController.dispose();
    _unitController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        children: [
          Text(
            'Add Grocery Item',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'e.g. Milk',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an item name';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    hintText: 'e.g. 4',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a quantity';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _unitController,
                  decoration: const InputDecoration(
                    labelText: 'Unit',
                    hintText: 'e.g. gallons, lbs',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final name = _nameController.text;
                      final quantity = int.parse(_quantityController.text);
                      final unit = _unitController.text;

                      // TODO: Add error handling for if this fails
                      await addGroceryItem(name, quantity, unit);

                      Navigator.pop(_sheetContext);
                    }
                  },
                  child: Text('Add Item'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
