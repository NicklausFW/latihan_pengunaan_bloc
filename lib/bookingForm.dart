import 'package:flutter/material.dart';

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Booking Form'),
          backgroundColor: Color(0xFF03A9F4),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter yourname';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: 'Full Name',
                      hintText: "Your Full Name",
                      border: OutlineInputBorder(),
                    ),
                    controller: fullNameController,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: 'Email',
                      hintText: "Your Email Address",
                      border: OutlineInputBorder(),
                    ),
                    controller: emailController,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: 'Phone Number',
                      hintText: "Your Phone Number",
                      border: OutlineInputBorder(),
                    ),
                    controller: phoneNumberController,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: 'City',
                      hintText: "Your City",
                      border: OutlineInputBorder(),
                    ),
                    controller: cityController,
                  ),
                ),
                Container(
                  width: 150,
                  margin: EdgeInsets.only(bottom: 0),
                  child: FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text("Success"),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        Text('Yourname: ' +
                                            fullNameController.text),
                                        Text('Email: ' + emailController.text),
                                        Text('Phone Number: ' +
                                            phoneNumberController.text),
                                        Text('City: ' + cityController.text),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                        child: Text('Save'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        })
                                  ],
                                ));
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text("Alert"),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        Text('Please Fill the blank field')
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                        child: Text('Okay'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        })
                                  ],
                                ));
                      }
                    },
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.save),
                          Spacer(flex: 1),
                          Text("Book now!"),
                          Spacer(flex: 2),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
