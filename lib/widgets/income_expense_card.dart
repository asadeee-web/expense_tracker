import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IncomeExpenseCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color amountColor;
  final IconData icon;

  const IncomeExpenseCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.amountColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(6),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: amountColor,
                ),
                child: Icon(icon, size: 18),
              ),
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, color: Color(0xff828282)),
                ),
                SizedBox(height: 5),
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: amountColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
