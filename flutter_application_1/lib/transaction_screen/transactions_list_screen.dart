import 'package:flutter/material.dart';

import 'package:flutter_application_1/transaction_screen/latest.dart';

import 'head.dart';

class TransactionsListScreen extends StatelessWidget {
  const TransactionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            Head(
              screenSize: screenSize,
            ),
            LatestTransaction(
              screenSize: screenSize,
            ),
          ]),
        ),
      ),
    );
  }
}
