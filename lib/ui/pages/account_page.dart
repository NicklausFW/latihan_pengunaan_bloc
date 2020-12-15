part of 'pages.dart';

class AccountPage extends StatefulWidget {
  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  bool isLoading = false;
  User _auth = FirebaseAuth.instance.currentUser;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  String img, name, email;
  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = selectedImage;
    });
  }

  void getUserUpdate() async {
    userCollection.doc(_auth.uid).snapshots().listen((event) {
      img = event.data()['profilePicture'];
      name = event.data()['name'];
      email = event.data()['email'];
      if (img == "") {
        img = null;
      }
      setState(() {});
    });
  }

  void initState() {
    getUserUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future getImage() async {
    //   // ignore: deprecated_member_use
    //   var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    //
    //   setState(() {
    //     image = img;
    //   });
    // }

    // PickedFile imageFile;
    // final ImagePicker imagePicker = ImagePicker();
    //
    // //function untuk mengambil gambar dari gallery
    // Future chooseImage() async {
    //   final selectedImage = await imagePicker.getImage(
    //       source: ImageSource.gallery, imageQuality: 50);
    //   setState(() {
    //     imageFile = selectedImage;
    //   });
    // }

    // Future uploadPic(BuildContext context) async {
    //   String fileName = basename(image.path);
    //
    //   FirebaseStorage _storage = FirebaseStorage.instance;
    //   ref = FirebaseStorage.instance.ref().child("profile").child(fileName);
    //   // uploadTask = ref.putFile(image);
    //   uploadTask = ref.putFile(image);
    //   imgUrl = await (await uploadTask).ref.getDownloadURL();
    //   await uploadTask.whenComplete(() => ref.getDownloadURL().then(
    //         (value) => imgUrl = value,
    //       ));
    //   final FirebaseAuth auth = FirebaseAuth.instance;
    //   final User user = auth.currentUser;
    //   final uid = user.uid;
    //
    //   // await Firestore.instance
    //   //     .collection("users").document()
    //   //     .({'profilePicture': imgUrl});
    //   await Firestore.instance
    //       .collection('users')
    //       .document('$uid')
    //       .set({"profilePicture": imgUrl});
    //   // userCollection.doc(userCollection.id).set({'profilePicture': imgUrl});
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
        centerTitle: true,
        leading: Container(),
      ),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Expanded(
                child: Card(
                  child: Column(children: <Widget>[
                    Builder(
                      builder: (context) => Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    radius: 100,
                                    backgroundColor: Color(0xff476cfb),
                                    child: ClipOval(
                                      child: SizedBox(
                                        width: 180,
                                        height: 180,
                                        child: CircleAvatar(
                                          radius: 100,
                                          backgroundImage: NetworkImage(
                                            img ??
                                                "https://icon-library.com/images/no-profile-picture-icon/no-profile-picture-icon-18.jpg",
                                          ),
                                        ),
                                        // (image != null)
                                        //     ? Image.file(image,
                                        //         fit: BoxFit.fill)
                                        //     : Image.network(
                                        //         "https://images.unsplash.com/photo-1487147264018-f937fba0c817?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
                                        //         fit: BoxFit.fill,
                                        //       ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 60),
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.camera,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      await chooseImage();
                                      await UserServices.updateProfilePicture(
                                              _auth.uid, imageFile)
                                          .then((value) {
                                        if (value) {
                                          Fluttertoast.showToast(
                                            msg:
                                                "Update profile picture succesfull!",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                        } else {
                                          Fluttertoast.showToast(
                                            msg: "Failed",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                        }
                                      });
                                      // getImage();
                                      // uploadPic(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Username',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    name ?? '',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    email ?? '',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),

                  // child: FutureBuilder<DocumentSnapshot>(
                  //     future: userCollection.doc(_auth.uid).get(),
                  //     builder: (BuildContext context,
                  //         AsyncSnapshot<DocumentSnapshot> snapshot) {
                  //       if (snapshot.hasError) {
                  //         return Text("Error getting info account");
                  //       }
                  //       if (snapshot.connectionState ==
                  //           ConnectionState.waiting) {
                  //         return SpinKitFadingCircle(
                  //           size: 50,
                  //           color: Colors.blue,
                  //         );
                  //       }
                  //       if (snapshot.connectionState ==
                  //           ConnectionState.done) {
                  //         Map<String, dynamic> data = snapshot.data.data();
                  //         userData = Users(data['id'], data['email'],
                  //             name: data['name'],
                  //             profilePicture: data['profilePicture']);
                  //       }
                  //       return Column(
                  //         children: <Widget>[
                  //           SizedBox(
                  //             height: 50,
                  //           ),
                  //           CircleAvatar(
                  //             backgroundImage: NetworkImage(
                  //               userData.profilePicture == ""
                  //                   ? "https://firebasestorage.googleapis.com/v0/b/flutterpractice-b5a4d.appspot.com/o/profile%2Fcovid-19-symptom-character-runny-nose-by-Vexels.png?alt=media&token=84a16750-7b4f-44f6-9474-279dd4969b2b"
                  //                   : userData.profilePicture,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //         ],
                  //       );
                  //     }),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Signout Confirmation"),
                              content: Text("Are you sure to signout?"),
                              actions: [
                                FlatButton(
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await AuthServices.signOut().then((value) {
                                      if (value) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return SignInPage();
                                            },
                                          ),
                                        );
                                        setState(() {
                                          isLoading = false;
                                        });
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                    });
                                  },
                                  child: Text("Yes"),
                                ),
                                FlatButton(
                                  child: Text("No"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    padding: EdgeInsets.all(12),
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    child: Text("SignOut"),
                  ),
                ),
              ),
            ],
          ),
        ),
        isLoading == true
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
                child: SpinKitFadingCircle(
                  size: 50,
                  color: Colors.blue,
                ),
              )
            : Container()
      ]),
    );
  }
}
