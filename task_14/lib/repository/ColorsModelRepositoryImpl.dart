import 'package:task_13/repository/ColorsModelRepository.dart';
import '../../repository/JsonFromAssets.dart';
import 'package:task_13/Model/colorModel.dart';
import 'package:flutter/services.dart' as root_bundle;

class ColorsModelRepositoryImpl implements ColorsModelRepository {
  @override
  Future<CbColors> getColors() async {
    final pathOfJson =
        await root_bundle.rootBundle.loadString("assets/colors.json");
    return ReadJsonFile.cbColorsFromJson(pathOfJson);
  }
}
