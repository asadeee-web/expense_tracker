import 'dart:math';

import 'package:expense_tracker/core/models/expense.dart';
import 'package:expense_tracker/core/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';

class HomeViewModel extends ChangeNotifier {
  final LocalStorageService _storageService = LocalStorageService();
  bool _loader = false;
  bool get loader => _loader;

  List<Expense> expenses = [];
  double totalBalance = 0.0;
  double totalIncome = 0.0;
  double totalExpense = 0.0;

  HomeViewModel() {
    loadExpenses();
  }

  final formatter = NumberFormat.currency(
    locale: 'en_PK',
    symbol: 'Rs ',
    decimalDigits: 0,
  );

  final formattedDate = DateFormat('dd MMM yyyy, hh:mm a');

  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController transTypeController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  Future<void> loadExpenses() async {
    _loader = true;
    expenses = await _storageService.getAllBills();

    updateBalances();
    _loader = false;
    notifyListeners();
  }

  Future<void> addTransaction() async {
    double? amountParsed = double.tryParse(amountController.text);

    if (amountParsed == null || amountParsed == 0) {
      Get.snackbar("Invalid", "Invalid amount entered.");
      return;
    }

    String transactionId = Random().nextInt(100000).toString();

    final newExpense = Expense(
      id: transactionId,
      title: titleController.text,
      amount: amountParsed,
      transType: transTypeController.text,
      note: noteController.text,
      dueDate: DateTime.now(),
    );

    await _storageService.addBill(newExpense);

    expenses.add(newExpense);
    updateBalances();
    clearControllers();
    Get.back();
    notifyListeners();
  }

  Future<void> deleteTransaction(String id) async {
    await _storageService.deleteBill(id);
    expenses.removeWhere((e) => e.id == id);
    updateBalances();
    notifyListeners();
  }

  void updateBalances() {
    totalIncome = expenses
        .where((e) => e.transType == 'Income')
        .fold(0.0, (sum, e) => sum + e.amount);
    totalExpense = expenses
        .where((e) => e.transType == 'Expense')
        .fold(0.0, (sum, e) => sum + e.amount);
    totalBalance = totalIncome - totalExpense;
  }

  void clearControllers() {
    titleController.clear();
    amountController.clear();
    noteController.clear();
    transTypeController.clear();
    notifyListeners();
  }
}
