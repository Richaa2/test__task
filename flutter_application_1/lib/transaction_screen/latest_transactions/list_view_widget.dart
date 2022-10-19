import 'package:flutter/material.dart';

import 'package:flutter_application_1/bloc/transaction_bloc/transaction_bloc.dart';
import 'package:flutter_application_1/models/transaction.dart';
import 'package:intl/intl.dart';

import 'list_tile.dart';

class ListViewWidget extends StatelessWidget {
  final TransactionLoaded state;
  const ListViewWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => divider(),
      itemBuilder: (context, index) {
        Transaction transaction = state.transactions[index];
        late String title;
        late String subTitle;
        late String time;
        late bool isToday;
        late bool isYesterday;
        late bool thisWeek;
        DateTime today = DateTime.now();

        //isToday definition
        transaction.dateTime.year == today.year &&
                transaction.dateTime.month == today.month &&
                transaction.dateTime.day == today.day
            ? isToday = true
            : isToday = false;

        //isYesterday definition
        DateTime.now()
                    .difference(transaction.dateTime)
                    .compareTo(const Duration(days: 1)) <
                1
            ? isYesterday = true
            : isYesterday = false;

        //thisWeek definition
        DateTime.now()
                    .difference(transaction.dateTime)
                    .compareTo(const Duration(days: 7)) <
                1
            ? thisWeek = true
            : thisWeek = false;

        //DateFormat for today or yesterday
        thisWeek == true && isYesterday == false
            ? time = DateFormat.EEEE().format(transaction.dateTime)
            : thisWeek == false
                ? time = DateFormat.yMd().format(transaction.dateTime)
                : thisWeek == true && isYesterday == true && isToday == false
                    ? time = 'Yesterday'
                    : thisWeek == true && isToday == true
                        ? time =
                            '${DateFormat.Hm().format(transaction.dateTime)} Today'
                        : time = '';

        //title definition
        transaction.payment == true
            ? title = 'Payment'
            : title = transaction.name!;

        //subtitle definition
        transaction.pending == true
            ? subTitle = 'Pending - ${transaction.describe}'
            : subTitle = transaction.describe;
        subTitle.toString().length > 25
            ? subTitle = subTitle.toString().replaceRange(25, null, '...')
            : subTitle;

        //time definition
        transaction.authorizedUser == true
            ? time = '${transaction.nameOfUser!} — $time'
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

  Divider divider() {
    return const Divider(
      thickness: 1,
      indent: 15,
      height: 1,
    );
  }
}
