import 'package:flutter/material.dart';

class ImageSourceUtil {

  static Image getImageByPath(String path, double width, double height) {
    return new Image.asset(path, width: width, height: height);
  }
}
