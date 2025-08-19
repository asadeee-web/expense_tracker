import 'package:expense_tracker/core/models/expense.dart';
import 'package:hive/hive.dart';

class LocalStorageService {
  static const String boxName = 'expenses';

  Future<void> addBill(Expense bill) async {
    final box = await Hive.openBox(boxName);
    await box.put(bill.id, bill.toMap());
  }

  Future<List<Expense>> getAllBills() async {
    final box = await Hive.openBox(boxName);
    return box.values
        .map((e) => Expense.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> deleteBill(String id) async {
    final box = await Hive.openBox(boxName);
    await box.delete(id);
  }
}
