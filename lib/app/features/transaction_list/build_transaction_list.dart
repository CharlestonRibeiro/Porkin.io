import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/features/transaction_list/transaction_delete_button.dart';
import 'package:porkinio/app/features/transaction_list/transaction_edit_button.dart';
import 'package:porkinio/app/models/transaction_model.dart';

Widget buildTransactionList(TransactionModel transactionModel) => ListTile(
      leading: transactionModel.category
          ? const Icon(
              Icons.savings,
              size: 40,
              color: AppColors.primaryLight,
            )
          : const Icon(
              Icons.paid,
              size: 40,
              color: AppColors.secondaryLight,
            ),
      title: Text(transactionModel.title),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          transactionModel.category
              ? Text('+ R\$ ${transactionModel.ammount.toStringAsFixed(2)}')
              : Text('− R\$ ${transactionModel.ammount.toStringAsFixed(2)}'),
          Text(DateFormat('dd/MM/yyy').format(transactionModel.date)),
        ],
      ),
      trailing: SizedBox(
        width: 120,
        child: Row(
          children: <Widget>[
            TransactionEditButton(transactionModel: transactionModel),
            TransactionDeleteButton(transactionModel: transactionModel),
          ],
        ),
      ),
    );
