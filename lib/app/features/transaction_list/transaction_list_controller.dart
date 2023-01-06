import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:porkinio/locator.dart';

class TransactionListController extends ChangeNotifier {


  

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List transactionList = [];

  Future createTransaction(TransactionModel transaction) async {
    final newTransaction = _firestore.collection('transactionTest').doc(locator.get<AuthService>().currentUser!.uid);
    transaction.id = locator.get<AuthService>().currentUser!.uid;
    await newTransaction.set(transaction.toJson());
    notifyListeners();
  }


  Stream<List<TransactionModel>> readAllTransactions(String id) => _firestore
      .collection('transactionTest')
      .where('id', isEqualTo: id)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => TransactionModel.fromJson(doc.data()))
          .toList());

  Future updateTransaction(TransactionModel transaction) async {
    _firestore
        .collection('transactionTest')
        .doc(transaction.id)
        .set(transaction.toMap());
    notifyListeners();
  }

  Future deleteTransaction(TransactionModel transaction) async {
    final id = transaction.id;
    final date = _firestore.doc("transactionTest/$id");
    date.delete();
    notifyListeners();
  }
}
