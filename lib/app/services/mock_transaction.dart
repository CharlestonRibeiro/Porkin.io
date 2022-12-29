import 'package:porkinio/app/models/transaction_model.dart';

final List<TransactionModel> transactionsMock = [
  TransactionModel(
    id: '1',
    title: 'Lanchonete',
    category: true,
    date: DateTime.now(),
    ammount: 21.00,
  ),
  TransactionModel(
    id: '2',
    title: 'Depósito',
    category: false,
    date: DateTime.now(),
    ammount: 100.00,
  ),
  TransactionModel(
    id: '3',
    title: 'Riachuelo',
    category: true,
    date: DateTime.now(),
    ammount: 59.90,
  ),
  TransactionModel(
    id: '4',
    title: 'Escola',
    category: false,
    date: DateTime.now(),
    ammount: 149.50,
  ),
  TransactionModel(
    id: '5',
    title: 'Inglês',
    category: false,
    date: DateTime.now(),
    ammount: 49.50,
  ),
];