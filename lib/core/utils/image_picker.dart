
import 'dart:io';

import 'package:image_picker/image_picker.dart';

final class ImagePickerUtil {
  final ImagePicker picker = ImagePicker();
  
  Future<File?> pickSingleImage({required ImageSource source}) async {
    var xFile = await picker.pickImage(source: source);
    if (xFile == null) {
      return null;
    }
    return await convertXFileToFile(xFile);

  }

  Future<File> convertXFileToFile(XFile xFile) async {
  // XFile'ı dosya yoluna çevirin
  String filePath = xFile.path;

  // Dosya yolunu kullanarak File nesnesini oluşturun
  File file = File(filePath);

  return file;
}

}