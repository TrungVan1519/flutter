import 'dart:math';

import 'package:flutter/material.dart';

// Expand() co tac dung tu dong thay doi kich thuoc thoa man kich thuoc
//    da cho
//    + flex: dung de so sanh giua cac child cua Expand() voi nhau
// FlatButton() giong nhu ImageButton() trong android
//    + onPress la su kien SetOnClickListener trong android
//      - Ham print() la ham cua dart core dung de in ra man hinh console
// StatelessWidget chi su dung cho cac Widgets khong co su thay doi ca ve UI lan
//    gia tri
// StatefulWidget su dung cho cac Widgets muon co su thay doi ve UI hoac gia tri
//    hoac ca 2
//      - Khi code trong class ke thua State<> thi gia tri cua Widget se bi thay
//            doi boi class ke thua StatefulWidget se tao lai cac Widgets trong
//            class ke thua State<> nhung no se chi thay doi gia tri (neu co),
//            con UI se khong thay doi ma phai dung:
//      - Ham setState() co tac dung cap nhat lai UI cho cac Widgets trong class
//            ke thua State<> bang co che sau: Chi co tat ca cac thu co lien
//            quan den du lieu trong ham setState() thi moi duoc update UI, con
//            cac thu khac muon update UI nhung khong co trong ham setState()
//            thi van khong duoc update UI

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Dice"),
          ),
          body: DicePage(),
        ),
      ),
    );

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1, rightDiceNum = 1;

  void changeBothOfImages() {
    leftDiceNum = new Random().nextInt(6) + 1;
    rightDiceNum = new Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red.shade900,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    // TH 1: Bam nut ben trai thi chi hinh ben trai doi
//                    leftDiceNum = new Random().nextInt(6) + 1;

                    // TH 2: Bam nut ben phai thi ca 2 hinh cung thay doi
                    // Day chinh la ap dung nguyen tac cua ham setState() da noi
                    //    o tren dau
                    changeBothOfImages();
                  });
                },
                child: Image(
                  image: AssetImage("images/dice$leftDiceNum.png"),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.teal.shade900,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    // TH 1: Bam nut ben phai thi chi hinh ben phai thay doi
//                    rightDiceNum = new Random().nextInt(6) + 1;

                    // TH 2: Bam nut ben phai thi ca 2 hinh cung thay doi
                    // Day chinh la ap dung nguyen tac cua ham setState() da noi
                    //    o tren dau
                    changeBothOfImages();
                  });
                },
                child: Image.asset('images/dice$rightDiceNum.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
