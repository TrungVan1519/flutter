import 'package:flutter/material.dart';
import '../components/attributes.dart';

class ReusableContainer extends StatelessWidget {
  // Vi App nay chua su dung den key nen khong can thiet doan code nay
//  const ReusableContainer({
//    Key key,
//  }) : super(key: key);

  final Color color;
  final Widget widgetChild;

  ReusableContainer({this.color, this.widgetChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: widgetChild,
    );
  }
}

class ReusableColumn extends StatelessWidget {
  final IconData icon;
  final String label;

  ReusableColumn({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}

class ReusableRawButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final ShapeBorder shapeBorder;

  ReusableRawButton({this.icon, this.onPressed, this.shapeBorder});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: shapeBorder,
      fillColor: rawMaterialButtonColor,
      elevation: 6.0,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPressed,
    );
  }
}

class ReusableGestureDetector extends StatelessWidget {
  final String title;
  final Function onTap;

  ReusableGestureDetector({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xFFEB1555),
        width: double.infinity,
        height: 80.0,
        margin: EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
