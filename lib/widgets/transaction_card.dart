import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onTapDelete;
  //final Color titleColor;
  final String category;
  final String amount;
  final String date;
  final Color amountColor;

  const TransactionCard({
    Key? key,
    required this.icon,
    required this.onTapDelete,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.amountColor,
    //required this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
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
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF1F3F5),
                    ),
                    child: icon,
                  ),
                  SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff828282),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              amount,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: amountColor,
                              ),
                            ),
                            Text(
                              date,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff828282),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              top: -2,
              right: 2,
              child: GestureDetector(
                onTap: onTapDelete,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF1F3F5),
                  ),
                  child: Icon(CupertinoIcons.xmark, size: 20),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
