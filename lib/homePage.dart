import 'package:flutter/material.dart';
import 'bookingForm.dart';

Color colorButton = Colors.white;

class HomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mission 1',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF03A9F4),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0.5, 0.0),
                colors: [Color(0xFF03A9F4), Color(0xFF26C6DA)],
              ),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Image.network(
                    'https://wwwimage-secure.cbsstatic.com/base/files/seo/sbsp_social_1200x627.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          'https://decider.com/wp-content/uploads/2016/07/really-internet-spongebob.jpg?quality=80&strip=all&w=646&h=431&crop=1',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          'https://imgix.bustle.com/elite-daily/2015/03/05175344/resting-bitchface.jpg?w=1020&h=574&fit=crop&crop=faces&auto=format%2Ccompress&cs=srgb&q=70',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2020/08/11/2825613314.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          'https://ilovespongebobsomuch.weebly.com/uploads/2/0/1/2/20122231/1177880.jpg?327',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Column(children: [
                      Expanded(
                          child: Text(
                        'Characters',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      )),
                      Expanded(
                          flex: 12,
                          child: ListView(
                            children: [
                              Text(
                                  'Siapa yang tidak mengenal sosok sponge kuning bercelana kotak satu ini? Dirilis pada 1999, SpongeBob Squarepants menjadi salah satu kartun terpopuler di dunia. Tak hanya dicintai karena keunikan karakter-karakternya, serial animasi karya Stephen Hillenburg ini juga terasa semakin menarik berkat alur cerita yang konyol dan menggelitik. Kisah dalam SpongeBob Squarepants berpusat pada kehidupan makhluk laut di kota Bikini Bottom, nama yang diambil dari bebatuan karang Bikini Atoll di Samudera Pasifik.',
                                  style: TextStyle(fontSize: 18)),
                              Text(
                                  'SpongeBob Squarepants digambarkan sebagai sosok ceria dan bersahabat. Ia tinggal di sebuah rumah berbentuk nanas dan bekerja sebagai koki di Krusty Krab. Restoran Krusty Krab dimiliki seorang kepiting merah pelit bernama Eugene Krabs. Sebelum menjadi pebisnis, Mr. Krabs merupakan seorang pelaut yang cukup ditakuti.',
                                  style: TextStyle(fontSize: 18)),
                              Text(
                                  'Selain sibuk membuat Krabby Patty setiap harinya, SpongeBob juga sering disibukkan dengan berbagai petualangan seru bersama sahabatnya, Patrick Star. Kegaduhan yang dibuat SpongeBob dan Patrick sering kali membuat Squidward Tentacles kesal. Ia akan melakukan berbagai cara untuk menghentikan dua tetangga menyebalkan itu.',
                                  style: TextStyle(fontSize: 18))
                            ],
                          ))
                    ]))
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(bottom: 20.0, right: 10.0),
            child: FlatButton(
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Text('Book Here!'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BookingForm();
                }));
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (colorButton == Colors.white) {
              colorButton = Colors.red;
            } else {
              colorButton = Colors.white;
            }
          });
        },
        child: Icon(Icons.favorite),
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: colorButton,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
