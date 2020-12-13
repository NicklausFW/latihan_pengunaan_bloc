part of 'services.dart';

class UserServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  static DocumentReference userDoc;
// ?? inisialisasi dengan kosongan, karena tidak ada isinya di awal pendaftaran
  static Future<void> updateUser(Users users) async {
    userCollection.doc(users.uid).set(
      {
        'uid': users.uid,
        'email': users.email,
        'name': users.name,
        'profilePicture': users.profilePicture ?? ""
      },
    );
  }
}
