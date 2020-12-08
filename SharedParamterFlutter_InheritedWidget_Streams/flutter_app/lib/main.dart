import 'package:flutter/material.dart';
import 'package:frideos_core/frideos_core.dart';
import 'data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ABC'),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: InheritedStreamedDataProvider(
            child: Center(child: InheritedStreamedDataProviderWidget()),
            data: StreamedValue<Data>(initialData: Data(text: 'ABC')),
          ),
        ),
      ),
    );
  }
}

class InheritedStreamedDataProvider extends InheritedWidget {
  final StreamedValue<Data>
      data /* =
      StreamedValue<Data>(initialData: Data(text: 'ABC'))*/
      ;

  InheritedStreamedDataProvider({
    Widget child,
    this.data,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedStreamedDataProvider oldWidget) =>
      data.value != oldWidget.data.value;

  static InheritedStreamedDataProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedStreamedDataProvider);
}

class InheritedStreamedDataProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = InheritedStreamedDataProvider.of(context).data;

    return Container(
      child: Column(
        children: <Widget>[
          Text('Parent'),
          Text('${data.value.text}'),
          InheritedStreamedDataProviderWidgetChild()
        ],
      ),
    );
  }
}

class InheritedStreamedDataProviderWidgetChild extends StatelessWidget {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = InheritedStreamedDataProvider.of(context).data;
    textController.text = data.value.text;

    return Container(
      margin: EdgeInsets.only(top: 12.0),
      padding: EdgeInsets.all(12.0),
      color: Colors.blueGrey[50],
      child: Column(
        children: <Widget>[
          Text('Grandchild'),
          Text('${data.value.text}'),
          Container(
            height: 12.0,
          ),
          TextField(
            controller: textController,
            decoration: InputDecoration(
                labelText: 'Text',
                hintText: 'Insert some text',
                border: OutlineInputBorder()),
            onSubmitted: (text) {
              data.value.text = text;
              data.refresh();
            },
          ),
        ],
      ),
    );
  }
}
