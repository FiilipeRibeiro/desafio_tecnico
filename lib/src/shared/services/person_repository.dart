import 'package:desafio_tecnico/src/shared/services/http_client_interface.dart';
import 'package:desafio_tecnico/src/shared/models/person_model.dart';

const url = 'http://localhost:8080/accounts';

class PersonRepository {
  final IHttpClient client;

  PersonRepository(this.client);

  Future<List<Account>> getAccounts() async {
    final response = await client.get(url);

    return (response as List).map((json) => Account.fromMap(json)).toList();
  }
}
