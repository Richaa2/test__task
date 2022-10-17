import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/transaction.dart';

import '../consts.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
    required this.title,
    required this.transaction,
    required this.subTitle,
    required this.time,
  }) : super(key: key);

  final title;
  final Transaction transaction;
  final subTitle;
  final time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(transaction.payment == true
              ? '+\$${transaction.sum}'
              : '\$${transaction.sum}')
        ],
      ),
      subtitle: Row(
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
      ),
      trailing: Icon(Icons.chevron_right_rounded),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.black87,
        ),
        child: Icon(
          Icons.apple,
          color: white,
        ),
      ),
    );
  }
}
