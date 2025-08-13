import 'package:expense_tracker/core/utils/textStyle.dart';
import 'package:expense_tracker/widgets/balance_card.dart';
import 'package:expense_tracker/widgets/income_expense_card.dart';
import 'package:expense_tracker/widgets/transaction_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Import the reusable IncomeExpenseCard widget

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                amount: "25,000 PKR",
                titleColor: Color(0xff828282),
                amountColor: Colors.black,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IncomeExpenseCard(
                    title: "Total Income",
                    amount: "+25,000 PKR",
                    amountColor: Color(0xff6FCF97),
                    icon: CupertinoIcons.arrow_down,
                  ),
                  SizedBox(width: 10),
                  IncomeExpenseCard(
                    title: "Total Expense",
                    amount: "-10,000 PKR",
                    amountColor: Color(0xffFF6A6A),
                    icon: CupertinoIcons.arrow_up,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("Recent Transactions", style: style16Bold),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return TransactionCard(
                    icon: Icons.tv, // TV Icon for the transaction
                    title: "Cashback Offer",
                    category: "Entertainment",
                    amount: "+\$30",
                    date: "Oct 30, 2021",
                    amountColor:
                        Colors.green, // Green color for positive amount
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
