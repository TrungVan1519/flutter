import 'dart:async';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  bool _downloading;
  String _dir;
  List<String> _images, _tempImages;
  String _zipPath = 'http://coderzheaven.com/youtube_flutter/images.zip';

//  String _zipPath = 'https://image-uploading.herokuapp.com/hue/1';
  String _localZipFileName = 'images.zip';

  @override
  void initState() {
    super.initState();

    _downloading = false;
    _initDir();
    _images = List();
    _tempImages = List();
  }

  void _initDir() async {
    if (_dir == null) {
      _dir = (await getApplicationDocumentsDirectory()).path;
      print(_dir);
    }
  }

  Future<File> _downloadFile(
      {@required String url, @required String fileName}) async {
    var file = File('$_dir/$fileName');
    var req = await http.Client().get(Uri.parse(url));
    return file.writeAsBytes(req.bodyBytes);
  }

  Future<void> _unarchiveAndSave(File zippedFile) async {
    _images.clear();

    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);

    for (var file in archive) {
      if (file.isFile) {
        String fileName = '$_dir/${file.name}';
        File outFile = File(fileName);
        print('File:: ${outFile.path}');

        _images.add(outFile.path);

        outFile = await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
    }
  }

  Future<void> downloadZip() async {
    setState(() {
      _downloading = true;
    });
    File zippedFile =
        await _downloadFile(url: _zipPath, fileName: _localZipFileName);
    await _unarchiveAndSave(zippedFile);
    setState(() {
      _downloading = false;
    });
  }

  buildList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.file(
            File(_images[index]),
            fit: BoxFit.fitWidth,
          );
        },
      ),
    );
  }

  progress() {
    return Container(
      width: 25,
      height: 25,
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 10.0, 20.0),
      child: CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test zip extracted'),
        actions: <Widget>[
          _downloading ? progress() : Container(),
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () {
              downloadZip();
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            buildList(),
          ],
        ),
      ),
    );
  }
}
