import 'package:task_13/Model/colorModel.dart';

abstract interface class ColorsModelRepository {
  Future<CbColors> getColors();
}