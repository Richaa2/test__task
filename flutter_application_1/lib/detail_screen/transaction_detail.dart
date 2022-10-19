import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/transaction.dart';
import 'package:flutter_application_1/detail_screen/transaction_detail_widget.dart';

class TransactionDetail extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetail({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: TransactionDetailWidget(transaction: transaction),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade300,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.blue,
        ),
      ),
    );
  }
}
