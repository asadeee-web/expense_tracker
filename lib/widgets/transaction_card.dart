import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String category;
  final String amount;
  final String date;
  final Color amountColor;

  const TransactionCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.amountColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon on the left
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF1F3F5), // Light background for the icon
            ),
            child: Icon(icon, size: 24, color: Colors.black),
          ),
          SizedBox(width: 16),

          // Column with Title, Amount, Category, and Date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Transaction Title
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),

                // Category
                Text(
                  category,
                  style: TextStyle(fontSize: 14, color: Color(0xff828282)),
                ),
                SizedBox(height: 8),

                // Amount and Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Amount
                    Text(
                      amount,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: amountColor,
                      ),
                    ),
                    // Date
                    Text(
                      date,
                      style: TextStyle(fontSize: 12, color: Color(0xff828282)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
