part of 'pages.dart';

class DetailProductPage extends StatefulWidget {
  final Products product;
  DetailProductPage({this.product});

  @override
  _DetailProductPageState createState() => _DetailProductPageState(product);
}

class _DetailProductPageState extends State<DetailProductPage> {
  Products product;
  _DetailProductPageState(this.product);

  FirebaseStorage storage = FirebaseStorage.instance;
  final ctrlName = TextEditingController();
  final ctrlPrice = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    ctrlName.dispose();
    ctrlPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product's Detail"),
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
                      controller: ctrlName..text = product.name,
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
                      controller: ctrlPrice..text = product.price.toString(),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money_rounded),
                          labelText: 'Price',
                          hintText: "Write product's price",
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 100,
                      child: Image.network(product.image),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(15),
                          child: Text("Update Product"),
                          onPressed: () async {
                            if (ctrlName.text == "" || ctrlPrice.text == "") {
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
                              bool result = await ProductServices.updateProduct(
                                  product.id, ctrlName.text, ctrlPrice.text);

                              if (result == true) {
                                Fluttertoast.showToast(
                                    msg: "Product was successfully updated",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16);

                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.of(context).pop();
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
                          width: 10,
                        ),
                        RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(15),
                          child: Text("Delete Product"),
                          onPressed: () async {
                            bool result =
                                await ProductServices.deleteProduct(product.id);
                            if (result == true) {
                              Fluttertoast.showToast(
                                  msg: "Product was successfully deleted",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16);
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.of(context).pop();
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
                          },
                        ),
                      ],
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
