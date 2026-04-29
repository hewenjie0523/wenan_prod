import 'dart:io';

import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:path/path.dart' as Path;

class PathUtils {
  static String relativePathFromAbsolute(String absolutePath) {
    if (Utils.isEmptyString(absolutePath)) return absolutePath;
    if (Path.isWithin(Application.userPath, absolutePath)) {
      return Path.relative(absolutePath, from: Application.userPath);
    }
    return absolutePath;
  }

  static String? absolutePathFromRelative(String? relativePath) {
    if (Utils.isEmptyString(relativePath)) return relativePath;
    if (Path.isWithin(Application.userPath, relativePath!)) {
      return relativePath;
    }
    return Path.absolute(Application.userPath, relativePath);
  }

  static makeSureDirectory(String directoryPath) async {
    if (Utils.isEmptyString(directoryPath)) return;
    final directory = Directory(directoryPath);
    if (!(await directory.exists())) {
      await directory.create(recursive: true);
    }
  }

  static removeDirectory(String? path, [bool recursive = false]) {
    if (Utils.isEmpty(path)) return ;
    final dir = Directory(path!);
    dir.exists().then((exists) {
      if (exists) dir.delete(recursive: recursive);
    });
  }
}