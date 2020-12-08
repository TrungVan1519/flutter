import 'package:flutter/material.dart';

class Data {
  String text;
  int counter;
  String dateTime;
  Data({this.text, this.counter, this.dateTime});
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InheritedDataProvider(
        child: InheritedDataWidget(),
        data: Data(text: 'ABC'),
      ),
    );
  }
}

class InheritedDataProvider extends InheritedWidget {
  final Data data;

  InheritedDataProvider({
    Widget child,
    this.data,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedDataProvider oldWidget) =>
      data != oldWidget.data;

  static InheritedDataProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedDataProvider);
}

class InheritedDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = InheritedDataProvider.of(context).data;

    return Container(
      child: Column(
        children: <Widget>[
          Text('Parent'),
          Text('${data.text}'),
          InheritedDataWidgetChild()
        ],
      ),
    );
  }
}

class InheritedDataWidgetChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = InheritedDataProvider.of(context).data;

    return Container(
      child: Column(
        children: <Widget>[
          Divider(),
          Text('Child'),
          Text('${data.text}'),
        ],
      ),
    );
  }
}
