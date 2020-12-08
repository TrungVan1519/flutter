import 'package:flutter_app/zip_extractor.dart';

class Product {
  String imgURL;

  Product(this.imgURL);

  void getImage() {
    ZipExtractor zipExtractor = ZipExtractor(zipPath: this.imgURL);
    zipExtractor.downloadZip();
//    print('path::' + zipExtractor.images[0]);
//    return ('/data/user/0/com.example.flutter_app/app_flutter/' +
//        zipExtractor.images[0]);
  }
}
