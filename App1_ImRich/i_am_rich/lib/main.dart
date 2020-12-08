import 'dart:io';

import 'package:flutter/material.dart';

// Some Widgets of Flutter
// Fluter doc
// Add images to android Folder and ios Folder as well
// Create App'icon image: default icon and circle icon (for Android)
// Tips: Auto add Center Widgets to code (Alt + Enter)


// Day la ham bat dau chay Flutter App
// MerterialApp: lam khung de chua moi Widgets khac
//    + home: hay chua Scaffold
// Scaffold: La Widget khung con cua  MerterialApp nhung no co the
//    chia thanh 2 phan rieng biet
//    + appBar: chua AppBar o tren dinh man hinh
//    + body: chua cac Widgets khac o phan than man hinh
// AppBar: La Widget di cung appBar trong Scafford
//    + title: chua Text
// Center: dung can giua tat ca cac Widgets khac ma no chua
//    + child: chua cac Widgets con o trong
// Text: hien thi noi dung nhu TextView, EditView trong Android Java
// Image: chua anh
//    + image: chua

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[900],
            title: Center(
              child: Text('Im rich App'),
            ),
          ),
          body: Center(
            child: Image(
                image:
//                  NetworkImage('https://www.w3schools.com/w3css/img_lights.jpg')
                    AssetImage('images/must_draw.png')),
          ),
        ),
      ),
    );
