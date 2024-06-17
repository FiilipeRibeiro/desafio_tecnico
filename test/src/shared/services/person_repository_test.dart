import 'dart:convert';
import 'package:desafio_tecnico/src/shared/services/http_client_interface.dart';

import 'package:desafio_tecnico/src/shared/services/person_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class IHttpClientMock extends Mock implements IHttpClient {}

void main() {
  test('Testando Repository', () async {
    final client = IHttpClientMock();
    final repository = PersonRepository(client);

    when(() => client.get(any()))
        .thenAnswer((_) async => jsonDecode(jsonResponse));

    final accounts = await repository.getAccounts();

    expect(accounts.length, 2);
    expect(accounts[0].id, '1');
    expect(accounts[1].id, '2');
  });
}

const jsonResponse = '''
    [
      {
        "id": "1",
        "number": "5621",
        "type": "GS3 TEC",
        "available_limit": 7867.8,
        "best_purchase_day": 20,
        "transactions": [
          {
            "date": "05/09",
            "description": "Apple",
            "amount": 545.99,
            "installments": 12,
            "icon": "apple"
          },
          {
            "date": "05/09",
            "description": "Uber*Uber*Trip",
            "amount": 12.96,
            "installments": 1,
            "icon": "uber"
          },
          {
            "date": "03/09",
            "description": "Carrefour",
            "amount": 349.76,
            "installments": 3,
            "icon": "carrefour"
          }
        ]
      },
      {
        "id": "2",
        "number": "8976",
        "type": "NAME",
        "available_limit": 5341,
        "best_purchase_day": 15,
        "transactions": [
          {
            "date": "04/09",
            "description": "Amazon",
            "amount": 159.99,
            "installments": 5,
            "icon": "amazon"
          },
          {
            "date": "02/09",
            "description": "Netflix",
            "amount": 45.9,
            "installments": 1,
            "icon": "netflix"
          },
          {
            "date": "01/09",
            "description": "Starbucks",
            "amount": 24.5,
            "installments": 1,
            "icon": "starbucks"
          }
        ]
      }
    ]
  ''';
