import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageSelect {
  static Future<XFile?> getImage() async {
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    return pickedImage;
  }
}
