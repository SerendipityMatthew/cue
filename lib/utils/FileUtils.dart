import 'dart:io';

class FileUtils {
  /// create a file for save the log of serial port
  static File? createFile(String filePath) {
    File file = new File(filePath);
    if (file.statSync().type != FileSystemEntityType.file) {
      print(
          "the file path it should be file, not a directory, filePath = $filePath");
      return null;
    }
    if (!file.existsSync()){
      file.createSync(recursive: true);
    }
  }
}
