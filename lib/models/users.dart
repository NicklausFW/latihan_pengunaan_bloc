part of 'models.dart';

//equatable mempermudah pelemparan data
class Users extends Equatable {
  final String uid;
  final String email;
  final String name;
  final String profilePicture;

  // {} artinya nga wajib diisi
  Users(this.uid, this.email, {this.name, this.profilePicture});

  @override
  // TODO: implement props
  List<Object> get props => [uid, email, name, profilePicture];
}
