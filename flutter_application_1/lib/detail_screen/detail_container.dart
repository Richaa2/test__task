import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/transaction.dart';

import '../consts.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    Key? key,
    required this.screenSize,
    required this.transaction,
  }) : super(key: key);

  final Size screenSize;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return _container([
      _buildStatus(),
      _buildNameOfUser(),
      _divider(),
      _buildSum(),
    ]);
  }

  Container _container(List<Widget> children) {
    return Container(
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(10)),
      width: screenSize.width,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children),
      ),
    );
  }

  Row _buildSum() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        Text('${transaction.sum}\$',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17))
      ],
    );
  }

  Divider _divider() {
    return const Divider(
      thickness: 1,
    );
  }

  Text _buildNameOfUser() {
    return Text(
      transaction.nameOfUser != null ? '${transaction.nameOfUser}' : 'Payment',
      style: const TextStyle(color: Colors.grey),
    );
  }

  Text _buildStatus() {
    return Text(
        transaction.pending == false ? 'Status: Approved' : 'Status: Pending',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17));
  }
}
