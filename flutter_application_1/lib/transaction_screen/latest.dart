import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/transaction_screen/list_view.dart';

class LatestTransaction extends StatelessWidget {
  const LatestTransaction({super.key, required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                'Latest Transactions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
        TransactionListView(screenSize: screenSize)
      ],
    );
  }
}
