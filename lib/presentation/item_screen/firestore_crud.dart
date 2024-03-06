import 'Package:cloud_firestore/cloud_firestore.dart';

class FirestoreCrud {
  final CollectionReference ingredients =
      FirebaseFirestore.instance.collection('ingredients_item');

  Future<void> create(String name, String id) {
    print('created');
    return ingredients
        .add({'name': name, 'id': id})
        .then((value) => print('Ingredient Added'))
        .catchError((error) => print('Failed to add ingredient: $error'));
  }

  read() {
    print('read');
  }

  update() {
    print('update');
  }

  delete() {
    print('delete');
  }

  exportData() {
    print('exported');
  }
}
