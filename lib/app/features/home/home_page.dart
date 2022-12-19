import 'package:flutter/material.dart';
import 'package:porkinio/app/common/widgets/transaction_form.dart';
import 'package:porkinio/app/features/home/home_controller.dart';
import 'package:porkinio/app/common/widgets/account_balance_card.dart';
import 'package:porkinio/app/common/widgets/custom_navigation_drawer.dart';
import 'package:porkinio/app/common/widgets/transaction_list_tile.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/app/common/constants/app_images.dart';
import 'package:porkinio/app/models/transaction_model.dart';
import 'package:porkinio/app/services/mock_transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeHomePage = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final transactionsController = TransactionController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Usuário!'),
        backgroundColor: AppColors.primaryDark,
      ),
      drawer: const CustomNavigationDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.02),
          ),
          AnimatedBuilder(
              animation: transactionsController,
              builder: (context, child) {
                return AccountBalanceCard(
                  transactionController: transactionsController,
                );
              }),
          Expanded(
            child: AnimatedBuilder(
                animation: transactionsController,
                builder: (context, child) {
                  return transactionsController.items.isEmpty
                      ? Image.asset(AppImages.porkin)
                      : ListView.builder(
                          itemCount: transactionsController.items.length,
                          itemBuilder: (ctx, i) => TransactionListTile(
                            transactionController: transactionsController,
                            transactionModel: transactionsController.items[i],
                          ),
                        );
                }),
          )
        ],
      ),

      //TODO: COMPONETIZAR floatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: TransactionForm(
                transactionController: transactionsController,
            
                ),
            ),
          );
        },

          //  Navigator.of(context).pushNamed(TransactionForm.routeTransactionForm,
          //    arguments: {'TransactionsController': transactionsController});
       
        child: const Icon(Icons.add),
      ),
    );
  }
}
