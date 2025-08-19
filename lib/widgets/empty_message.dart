import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  final double iconSize;
  final Color color;

  const EmptyMessage({
    super.key,
    required this.message,
    this.icon = CupertinoIcons.doc_text_search,
    this.iconSize = 60,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: iconSize, color: color),
            const SizedBox(height: 12),
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
