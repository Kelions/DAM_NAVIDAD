import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  Stream<QuerySnapshot> regalos(String amigoID) {
    print(amigoID);
    return FirebaseFirestore.instance
        .collection('regalos')
        .where('amigo_id', isEqualTo: amigoID)
        .snapshots();
  }

  Future regalosAgregar(String amigoID, String regalo, String descripcion,
      int valor, String tienda) {
    return FirebaseFirestore.instance.collection('regalos').doc().set({
      'amigo_id': amigoID,
      'idea': regalo,
      'descripcion': descripcion,
      'valor': valor,
      'tienda': tienda
    });
  }

  Future regalosActualizar(String regaloID, String amigoID, String regalo,
      String descripcion, int valor, String tienda) {
    return FirebaseFirestore.instance.collection('regalos').doc(regaloID).set({
      'amigo_id': amigoID,
      'idea': regalo,
      'descripcion': descripcion,
      'valor': valor,
      'tienda': tienda
    });
  }

  Future regalosBorrar(String regaloID) {
    return FirebaseFirestore.instance
        .collection('regalos')
        .doc(regaloID)
        .delete();
  }

  // Amigos
  Stream<QuerySnapshot> amigos() {
    String? userUID = FirebaseAuth.instance.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection('amigos')
        .where("user_uid", isEqualTo: userUID)
        .snapshots();
  }

  Future amigosAgregar(
      String nombre, String email, String descripcion, String profesion) async {
    String? userUID = FirebaseAuth.instance.currentUser?.uid;
    return FirebaseFirestore.instance.collection('amigos').doc().set({
      'user_uid': userUID,
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
    String? userUID = FirebaseAuth.instance.currentUser?.uid;
    return FirebaseFirestore.instance.collection('amigos').doc(amigoID).set({
      'user_uid': userUID,
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
