import 'package:expense_tracker/core/utils/colors.dart';
import 'package:expense_tracker/core/utils/textStyle.dart';
import 'package:expense_tracker/features/home/home_view_model.dart';
import 'package:expense_tracker/widgets/balance_card.dart';
import 'package:expense_tracker/widgets/empty_message.dart';
import 'package:expense_tracker/widgets/income_expense_card.dart';
import 'package:expense_tracker/widgets/shimmer.dart';
import 'package:expense_tracker/widgets/transaction_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_ui_kit/widgets/smart_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Dashboard",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BalanceCard(
                    title: "Total Balance",
                    amount: "${model.totalBalance} PKR",
                    titleColor: Color(0xff828282),
                    amountColor: Colors.black,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      IncomeExpenseCard(
                        title: "Total Income",
                        amount: "+${model.totalIncome} PKR",
                        amountColor: Color(0xff6FCF97),
                        icon: CupertinoIcons.up_arrow,
                      ),
                      SizedBox(width: 10),
                      IncomeExpenseCard(
                        title: "Total Expense",
                        amount: "-${model.totalExpense} PKR",
                        amountColor: Color(0xffFF6A6A),
                        icon: CupertinoIcons.down_arrow,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Recent Transactions", style: style16Bold),

                  // inside your widget build
                  model.loader
                      ? CustomShimmer()
                      : (model.expenses.isEmpty
                            ? const EmptyMessage(message: "No Transactions")
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: model.expenses.length,
                                itemBuilder: (context, index) {
                                  final transaction = model.expenses[index];
                                  return TransactionCard(
                                    onTapDelete: () {
                                      model.deleteTransaction(transaction.id);
                                    },
                                    icon: transaction.transType == "Income"
                                        ? const Icon(
                                            CupertinoIcons.arrow_up,
                                            color: Colors.green,
                                          )
                                        : const Icon(
                                            CupertinoIcons.arrow_down,
                                            color: Colors.red,
                                          ),
                                    title: transaction.title,
                                    category: transaction.transType,
                                    amount: model.formatter.format(
                                      transaction.amount,
                                    ),
                                    date: model.formattedDate.format(
                                      transaction.dueDate,
                                    ),
                                    amountColor:
                                        transaction.transType == "Income"
                                        ? Colors.green
                                        : Colors.red,
                                  );
                                },
                              )),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey[300],
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: AppColors.lightGrey,
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return bottomSheetMethod(context, model);
                },
              );
            },
            child: Icon(CupertinoIcons.add, color: Colors.white),
          ),
        );
      },
    );
  }

  Padding bottomSheetMethod(BuildContext context, HomeViewModel model) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title TextField
            TextField(
              controller: model.titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            SizedBox(height: 10),

            // Amount TextField
            TextField(
              controller: model.amountController,
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),

            // Dropdown for Transaction Type
            DropdownButtonFormField(
              value: model.transTypeController.text.isEmpty
                  ? null
                  : model.transTypeController.text,
              onChanged: (String? newValue) {
                // Update the text controller with the selected transaction type
                if (newValue != null) {
                  model.transTypeController.text = newValue;
                }
              },
              decoration: InputDecoration(labelText: "Transaction Type"),
              items: ["Income", "Expense"].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
            ),
            SizedBox(height: 10),

            // Note TextField
            TextField(
              controller: model.noteController,
              decoration: InputDecoration(labelText: "Note"),
            ),
            SizedBox(height: 20),

            // Save Button
            SmartButtonAlt(
              label: "Save",
              width: double.infinity,
              onPressed: () {
                model.addTransaction(); // Call to add the transaction
              },
              textColor: Colors.white,
              backgroundColor: AppColors.primaryColor,
              fontSize: 16,
              borderRadius: 10,
              elevation: 0,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
