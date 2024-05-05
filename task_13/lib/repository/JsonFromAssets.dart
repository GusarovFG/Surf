import 'dart:convert';

import 'package:task_13/Model/colorModel.dart';

class ReadJsonFile {
  static CbColors cbColorsFromJson(String str) => CbColors.fromJson(json.decode(str));
}
