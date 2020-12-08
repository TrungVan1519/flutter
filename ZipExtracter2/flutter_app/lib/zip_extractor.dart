import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ZipExtractor {
  bool downloading = false;

  String dir;
  List<String> images;
  String zipPath;
  final String _localZipFileName = 'images.zip';

  ZipExtractor({@required this.zipPath}) {
    _initDir();
    images = List();
  }

  void _initDir() async {
    if (dir == null) {
      dir = (await getApplicationDocumentsDirectory()).path;
      print(dir);
    }
  }

  Future<File> _downloadFile(
      {@required String url, @required String fileName}) async {
    var file = File('$dir/$fileName');
    var req = await http.Client().get(Uri.parse(url));
    return file.writeAsBytes(req.bodyBytes);
  }

  Future<void> _unarchiveAndSave(File zippedFile) async {
    images.clear();

    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);

    for (var file in archive) {
      if (file.isFile) {
        String fileName = '$dir/${file.name}';
        File outFile = File(fileName);
        print('File:: ${outFile.path}');

        images.add(outFile.path);

        for (var abc in images) {
          print('path: $abc');
        }

        outFile = await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
    }
  }

  Future<void> downloadZip() async {
    File zippedFile =
        await _downloadFile(url: zipPath, fileName: _localZipFileName);
    await _unarchiveAndSave(zippedFile);
  }
}
