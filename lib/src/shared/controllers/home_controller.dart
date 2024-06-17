import 'package:desafio_tecnico/src/shared/models/person_model.dart';
import 'package:desafio_tecnico/src/shared/services/person_repository.dart';

class HomeController{
  final PersonRepository _repository;

  HomeController(this._repository);

  var accounts = <Account>[];

  Future<void> fetchAllAccounts() async {
    accounts = await _repository.getAccounts();
  }
}
