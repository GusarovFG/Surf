import 'package:task_13/Presentors/MainScreenContract.dart';
import 'package:task_13/diEj/diEj.dart';
import 'package:task_13/repository/ColorsModelRepository.dart';

class MainScreenPresenter{

  MainScreenContract _view;

  late ColorsModelRepository _repository;
  
  MainScreenPresenter(this._view) {
    _repository = Injector().colorRepository;
  }

  void loadColors() async {
    await _repository.getColors().then((colors) => _view.fetchFutureColors(colors));
  }
}

