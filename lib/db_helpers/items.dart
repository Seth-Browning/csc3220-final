import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _userId = FirebaseAuth.instance.currentUser!.uid;

Future<void> addGroceryItem(String name, int quantity, String unit) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(_userId)
      .collection('groceryItems')
      .add({
        'name': name,
        'quantity': quantity,
        'unit': unit,
        'isPurchased': false,
        'createdAt': FieldValue.serverTimestamp(),
        'source': 'manual',
      });
}

Stream<QuerySnapshot> groceryStream = FirebaseFirestore.instance
    .collection('users')
    .doc(_userId)
    .collection('groceryItems')
    .snapshots();
