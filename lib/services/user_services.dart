part of 'services.dart';

class UserServices {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  static Reference ref;
  static UploadTask uploadTask;
  static String imageUrl;
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

  static Future updateProfilePicture(String uid, PickedFile imageFile) async {
    String fileName = uid + ".png";
    ref = FirebaseStorage.instance.ref().child('profile').child(fileName);
    uploadTask = ref.putFile(File(imageFile.path));
    await uploadTask.whenComplete(
        () => ref.getDownloadURL().then((value) => imageUrl = value));
    return userCollection
        .doc(uid)
        .update({
          'profilePicture': imageUrl,
        })
        .then((value) => true)
        .catchError((onError) => false);
  }
}
