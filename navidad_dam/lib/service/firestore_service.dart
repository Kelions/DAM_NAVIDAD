import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Stream<QuerySnapshot> regalos() {
    return FirebaseFirestore.instance.collection('regalos').snapshots();
  }

  Stream<QuerySnapshot> amigos() {
    return FirebaseFirestore.instance.collection('amigos').snapshots();
  }
}
