part of 'extensions.dart';

//FirebaseUser --> User
extension FirebaseUserExtension on User {
  // firebase user dimodifikasi
  // name: name karena tidak wajib diisi
  Users convertToUser({String name = "No Name"}) =>
      Users(this.uid, this.email, name: name);
}
