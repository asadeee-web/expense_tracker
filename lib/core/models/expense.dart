import 'package:flutter/material.dart';

class Expense {
  final String id;
  final String title;
  final double amount;
  //  final String note;
  //final Icon tag;
  final DateTime dueDate;
  final String transType;
  //  bool isPaid;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.dueDate,
    required this.transType,
    //required this.note,
    // required this.tag,
    // this.isPaid = false,
  });

  // For Hive storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'dueDate': dueDate.toIso8601String(),
      'transType': transType,
      // 'note': note,
      //  "tag": tag,
      // 'isPaid': isPaid,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      //note: map['note'],
      dueDate: DateTime.parse(map['dueDate']),
      transType: map['transType'],
      // tag: map['tag'],
      // isPaid: map['isPaid'],
    );
  }
}
