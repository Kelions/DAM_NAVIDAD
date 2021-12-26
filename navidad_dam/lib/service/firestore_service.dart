import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  Stream<QuerySnapshot> regalos() {
    return FirebaseFirestore.instance.collection('regalos').snapshots();
  }

  // Amigos
  Stream<QuerySnapshot> amigos() {
    return FirebaseFirestore.instance.collection('amigos').snapshots();
  }

  Future amigosAgregar(
      String nombre, String email, String descripcion, String profesion) async {
    FirebaseFirestore.instance.collection('amigos').doc().set({
      'nombre': nombre,
      'email': email,
      'descripcion': descripcion,
      'profesion': profesion
    });
  }

  Stream<DocumentSnapshot> amigo(String amigoID) {
    return FirebaseFirestore.instance
        .collection('amigos')
        .doc(amigoID)
        .snapshots();
  }

  Future amigosActualizar(String amigoID, String nombre, String email,
      String descripcion, String profesion) {
    return FirebaseFirestore.instance.collection('amigos').doc(amigoID).set({
      'nombre': nombre,
      'email': email,
      'descripcion': descripcion,
      'profesion': profesion
    });
  }

  Future amigosBorrar(String amigoID) {
    return FirebaseFirestore.instance
        .collection('amigos')
        .doc(amigoID)
        .delete();
  }
}
