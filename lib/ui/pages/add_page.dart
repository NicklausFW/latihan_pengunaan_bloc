part of 'pages.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final ctrlName = TextEditingController();
  final ctrlPrice = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    ctrlName.dispose();
    ctrlPrice.dispose();
    super.dispose();
  }

  void clearForm() {
    ctrlName.clear();
    ctrlPrice.clear();
    setState(() {
      imageFile = null;
    });
  }

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  //function untuk mengambil gambar dari gallery
  Future chooseImage() async {
    final selectedImage = await imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      imageFile = selectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
        centerTitle: true,
        leading: Container(),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: ctrlName,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_tree_rounded),
                          labelText: 'Product Name',
                          hintText: "Write your product name",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ctrlPrice,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money_rounded),
                          labelText: 'Price',
                          hintText: "Write product's price",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    imageFile == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton.icon(
                                onPressed: () {
                                  chooseImage();
                                },
                                icon: Icon(Icons.image_rounded),
                                label: Text("Choose from gallery"),
                              ),
                              Text("File not found"),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton.icon(
                                onPressed: () {
                                  chooseImage();
                                },
                                icon: Icon(Icons.image_rounded),
                                label: Text("Rechoose from gallery"),
                              ),
                              Semantics(
                                child: Image.file(
                                  File(imageFile.path),
                                  width: 100,
                                ),
                              )
                            ],
                          ),
                    SizedBox(
                      height: 40,
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(15),
                      child: Text("Add Product"),
                      onPressed: () async {
                        if (ctrlName.text == "" ||
                            ctrlPrice.text == "" ||
                            imageFile == null) {
                          Fluttertoast.showToast(
                              msg: "Please fill all fields!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16);
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          Products product =
                              Products("", ctrlName.text, ctrlPrice.text, "");
                          bool result = await ProductServices.addProduct(
                              product, imageFile);
                          if (result == true) {
                            Fluttertoast.showToast(
                                msg: "Product was successfully added",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16);
                            clearForm();
                            setState(() {
                              isLoading = false;
                            });
                          } else {
                            Fluttertoast.showToast(
                                msg: "Failed! Try again",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16);
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
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
        ],
      ),
    );
  }
}
