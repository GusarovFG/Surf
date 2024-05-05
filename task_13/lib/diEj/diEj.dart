import 'package:task_13/repository/ColorsModelRepository.dart';
import 'package:task_13/repository/ColorsModelRepositoryImpl.dart';

class Injector {

  static final Injector _singleton = Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ColorsModelRepository get colorRepository {
    return ColorsModelRepositoryImpl();
  }
}