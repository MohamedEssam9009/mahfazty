import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future loginUser(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future registerUser(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future signOutUser() async {
    await auth.signOut();
  }

  User? getCurrentUser() {
    return auth.currentUser;
  }

  Future<void> addTransaction(
    String userId,
    String name,
    String price,
    String date,
  ) async {
    try {
      await firestore
          .collection('transactions')
          .doc(userId)
          .collection('transactions')
          .add({
        'name': name,
        'price': price,
        'date': date,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
