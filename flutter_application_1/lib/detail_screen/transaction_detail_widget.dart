import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../consts.dart';
import 'detail_container.dart';
import '../models/transaction.dart';

class TransactionDetailWidget extends StatelessWidget {
  const TransactionDetailWidget({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var time =
        '${DateFormat.yMd().format(transaction.dateTime)}   ${DateFormat.jms().format(transaction.dateTime)}';

    return _column([
      _buildSum(),
      _buildName(),
      _buildTime(time),
      _sizedBox(30),
      DetailContainer(screenSize: screenSize, transaction: transaction),
      _sizedBox(20),
      _describeContainer(screenSize)
    ]);
  }

  Padding _column(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Column(children: children),
      ),
    );
  }

  SizedBox _sizedBox(double? height) {
    return SizedBox(
      height: height,
    );
  }

  Text _buildTime(String time) {
    return Text(
      time,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Text _buildName() {
    return Text(
      transaction.name != null ? '${transaction.name}' : '',
      style: const TextStyle(color: Colors.grey),
    );
  }

  Text _buildSum() {
    return Text(
      '${transaction.sum}\$',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 65),
    );
  }

  Container _describeContainer(Size screenSize) {
    return Container(
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
      width: screenSize.width,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Describe:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              Text(transaction.describe)
            ]),
      ),
    );
  }
}
