import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/bloc/transaction_bloc.dart';
import 'package:flutter_application_1/models/transaction.dart';
import 'package:intl/intl.dart';

import 'list_tile.dart';

class ListViewWidget extends StatelessWidget {
  final TransactionLoaded state;
  const ListViewWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
        indent: 15,
        height: 1,
      ),
      itemBuilder: (context, index) {
        Transaction transaction = state.transactions[index];
        late String? title;
        late String subTitle;
        late String time;
        late bool isToday;
        late bool isYesterday;
        late bool thisWeek;
        var today = DateTime.now();
        transaction.dateTime.year == today.year &&
                transaction.dateTime.month == today.month &&
                transaction.dateTime.day == today.day
            ? isToday = true
            : isToday = false;

        if (DateTime.now()
                .difference(transaction.dateTime)
                .compareTo(const Duration(days: 1)) <
            1) {
          isYesterday = true;
        } else {
          isYesterday = false;
        }

        if (DateTime.now()
                .difference(transaction.dateTime)
                .compareTo(const Duration(days: 7)) <
            1) {
          thisWeek = true;
        } else {
          thisWeek = false;
        }

        thisWeek == true && isYesterday == false
            ? time = DateFormat.EEEE().format(transaction.dateTime)
            : thisWeek == false
                ? time = DateFormat.yMd().format(transaction.dateTime)
                : thisWeek == true && isYesterday == true && isToday == false
                    ? time = 'Yesterday'
                    : thisWeek == true && isToday == true
                        ? time = DateFormat.Hm().format(transaction.dateTime) +
                            ' Today'
                        : time = '';

        transaction.payment == true
            ? title = 'Payment'
            : title = transaction.name;

        transaction.pending == true
            ? subTitle = 'Pending - ' + transaction.describe
            : subTitle = transaction.describe;
        subTitle.toString().length > 25
            ? subTitle = subTitle.toString().replaceRange(25, null, '...')
            : subTitle;

        transaction.authorizedUser == true
            ? time = transaction.nameOfUser! + ' — ' + time
            : time;

        return ListTileWidget(
            title: title,
            transaction: transaction,
            subTitle: subTitle,
            time: time);
      },
      itemCount: state.transactions.length,
    );
  }
}
