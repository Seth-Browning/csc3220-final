
import 'package:csc322_starter_app/models/grocery_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemList extends ConsumerStatefulWidget {

  const ItemList({super.key, required this.listTitle, required this.groceryItems});

  final String listTitle;
  final List<GroceryItem> groceryItems;

  @override
  ConsumerState<ItemList> createState() => _ItemListState();
}

class _ItemListState extends ConsumerState<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.listTitle)
      ],
    );
  }
}