class Account {
  final String id;
  final String number;
  final String type;
  final double availableLimit;
  final int bestPurchaseDay;
  final List<Transaction> transactions;

  Account({
    required this.id,
    required this.number,
    required this.type,
    required this.availableLimit,
    required this.bestPurchaseDay,
    required this.transactions,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'type': type,
      'available_limit': availableLimit,
      'best_purchase_day': bestPurchaseDay,
      'transactions': transactions.map((x) => x.toMap()).toList(),
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as String,
      number: map['number'] as String,
      type: map['type'] as String,
      availableLimit: (map['available_limit'] as num).toDouble(),
      bestPurchaseDay: map['best_purchase_day'] as int,
      transactions: List<Transaction>.from(
        (map['transactions'] as List<dynamic>).map<Transaction>(
          (x) => Transaction.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  // Para Testes
  static List<Account> stub() => [
        Account(
          id: '1',
          number: '1',
          type: '1',
          availableLimit: 7867.8,
          bestPurchaseDay: 20,
          transactions: [],
        )
      ];
}

class Transaction {
  final String date;
  final String description;
  final double amount;
  final int installments;
  final String icon;

  Transaction({
    required this.date,
    required this.description,
    required this.amount,
    required this.installments,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'description': description,
      'amount': amount,
      'installments': installments,
      'icon': icon,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      date: map['date'] as String,
      description: map['description'] as String,
      amount: (map['amount'] as num).toDouble(),
      installments: map['installments'] as int,
      icon: map['icon'] as String,
    );
  }
}
