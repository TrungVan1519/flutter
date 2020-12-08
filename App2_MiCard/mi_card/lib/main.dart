import 'package:flutter/material.dart';

// CircleAvatar Widget dung de hien thi anh theo hinh tron
// Icon Widget dung de hien thi icon
// SizedBox Widget dung de tao khoang cach giua cac Widgets khac
// Card Widget khong co thuoc tinh padding nen khi su dung Card Widget
//    nen su dung Widget con phai la Padding Widget

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Mi Card UI'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.teal,
                backgroundImage: AssetImage('images/netmarble.jpg'),
                radius: 50,
              ),
              Text(
                'Tr',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'Pacifico',
                  color: /*Colors.teal[900]*/ Colors.teal.shade900,
                ),
              ),
              SizedBox(
                width: 500 / 1.5,
                height: 20,
                child: Divider(
                  thickness: 1.0,
                  color: Colors.white,
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '123 456 789',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: Colors.teal.shade900,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'blah@gmail.com',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.teal.shade900,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: ListTile(
                  leading: Icon(
                    Icons.add_location,
                    size: 30,
                    color: Colors.teal.shade900,
                  ),
                  title: Text(
                    'Viet Nam',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal.shade900,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
