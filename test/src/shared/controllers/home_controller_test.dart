import 'package:desafio_tecnico/src/shared/controllers/home_controller.dart';
import 'package:desafio_tecnico/src/shared/models/person_model.dart';
import 'package:desafio_tecnico/src/shared/services/person_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

void main() {
  test('Deve preencher a lista corretamente', () async {
    final repository = PersonRepositoryMock();
    when(() => repository.getAccounts())
        .thenAnswer((_) async => Account.stub());

    final controller = HomeController(repository);
    await controller.fetchAllAccounts();

    expect(controller.accounts.length, 1);
  });
}
