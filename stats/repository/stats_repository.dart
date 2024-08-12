import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StatsRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  StatsRepository(this._firestore, this._auth);

  Future<List<num>> getStats() async {
    try {
      num totalCo2Saved = 0.0;
      num totalLandfillSaved = 0.0;
      final user = _auth.currentUser;
      final stats = await _firestore
          .collection('users')
          .doc(user!.uid)
          .collection('compost')
          .get();
      // for each document in the collection, get the co2 and landfill saved
      // and add them to the total
      stats.docs.forEach((doc) {
        totalCo2Saved += doc['co2Saved'];
        totalLandfillSaved += doc['landfillSaved'];
      });
      return [totalCo2Saved, totalLandfillSaved];
    } catch (e) {
      throw Exception(e);
    }
  }
}
