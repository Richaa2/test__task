import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/transaction_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../consts.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionBloc, TransactionState>(
      listener: (context, state) {
        log(state.toString());
      },
      builder: (context, state) {
        if (state is TransactionInitial) {
          BlocProvider.of<TransactionBloc>(context)
              .add(TransactionStartEvent());
        }

        if (state is TransactionLoaded) {
          return Container(
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(15)),
            width: screenSize.width - 15,
            height: 550,
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                indent: 15,
                height: 1,
              ),
              itemBuilder: (context, index) {
                var transaction = state.transactions[index];
                late var title;
                late var subTitle;
                late var time;
                late var isToday;
                late var isYesterday;
                late var thisWeek;
                var today = DateTime.now();
                if (transaction.dateTime.year == today.year &&
                    transaction.dateTime.month == today.month &&
                    transaction.dateTime.day == today.day) {
                  isToday = true;
                } else {
                  isToday = false;
                }

                if (DateTime.now()
                        .difference(transaction.dateTime)
                        .compareTo(Duration(
                          days: 1,
                        )) <
                    1) {
                  isYesterday = true;
                } else {
                  isYesterday = false;
                }

                if (DateTime.now()
                        .difference(transaction.dateTime)
                        .compareTo(Duration(days: 7)) <
                    1) {
                  thisWeek = true;
                } else {
                  thisWeek = false;
                }

                if (thisWeek == true && isYesterday == false) {
                  time = DateFormat('EEEE').format(transaction.dateTime);
                } else if (thisWeek == false) {
                  time = DateFormat.yMd().format(transaction.dateTime);
                } else if (thisWeek == true &&
                    isYesterday == true &&
                    isToday == false) {
                  time = 'Yesterday';
                } else if (thisWeek == true && isToday == true) {
                  time =
                      DateFormat.Hm().format(transaction.dateTime) + ' Today';
                }

                transaction.payment == true
                    ? title = 'Payment'
                    : title = transaction.name;

                transaction.pending == true
                    ? subTitle = 'Pending - ' + transaction.describe
                    : subTitle = transaction.describe;
                if (subTitle.toString().length > 25) {
                  subTitle = subTitle.toString().replaceRange(25, null, '...');
                }

                print(subTitle.toString().replaceRange(10, null, '...'));
                transaction.authorizedUser == true
                    ? time = transaction.nameOfUser! + ' — ' + time
                    : time;

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
              },
              itemCount: state.transactions.length,
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
