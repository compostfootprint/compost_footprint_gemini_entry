import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compost_footprint/compostable_item/model/compostable_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CompostableRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  const CompostableRepository(this._firestore, this._auth);

  Future<void> addItemToCompost(CompostableItemModel item) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('compost')
          .add({
        ...item.toJson(),
        'dateTime': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }
}
