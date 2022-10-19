import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/transaction.dart';
import 'package:flutter_application_1/detail_screen/transaction_detail.dart';

import '../../consts.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
    required this.title,
    required this.transaction,
    required this.subTitle,
    required this.time,
  }) : super(key: key);

  final String title;
  final Transaction transaction;
  final String subTitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToDetail(context),
      child: ListTile(
        isThreeLine: true,
        title: _buildTitle(),
        subtitle: _buildSubtitle(),
        trailing: _buildTrailing(),
        leading: _buildLeading(),
      ),
    );
  }

  Future<dynamic> _navigateToDetail(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => TransactionDetail(
                  transaction: transaction,
                ))));
  }

  Icon _buildTrailing() => const Icon(Icons.chevron_right_rounded);

  Container _buildLeading() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black87,
      ),
      child: Icon(
        transaction.icon,
        color: white,
      ),
    );
  }

  Row _buildSubtitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(subTitle), Text(time)],
        ),
        Text(
          transaction.payment == false ? '3%' : '',
          style: TextStyle(backgroundColor: Colors.grey.shade200),
        ),
      ],
    );
  }

  Row _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(transaction.payment == true
            ? '+\$${transaction.sum}'
            : '\$${transaction.sum}')
      ],
    );
  }
}
