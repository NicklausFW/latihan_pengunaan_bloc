part of 'widgets.dart';

class UserCard extends StatelessWidget {
  final Users user;

  UserCard({this.user});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            user.profilePicture == ""
                ? "https://firebasestorage.googleapis.com/v0/b/flutterpractice-b5a4d.appspot.com/o/profile%2Fcovid-19-symptom-character-runny-nose-by-Vexels.png?alt=media&token=84a16750-7b4f-44f6-9474-279dd4969b2b"
                : user.profilePicture,
          ),
        ),
      ),
    );
  }
}
