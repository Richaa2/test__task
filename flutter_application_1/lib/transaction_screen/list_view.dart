import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../consts.dart';
import '../models/bloc/transaction_bloc.dart';

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

                late var thisWeek;
                print(transaction.dateTime);
                if (DateTime.now()
                        .difference(transaction.dateTime)
                        .compareTo(Duration(days: 7)) <
                    1) {
                  thisWeek = true;
                  print(thisWeek.toString() + index.toString());
                } else {
                  thisWeek = false;
                  print(thisWeek.toString() + index.toString());
                }

                transaction.payment == true
                    ? title = 'Payment'
                    : title = transaction.name;

                transaction.pending == true
                    ? subTitle = 'Pending -' + transaction.describe
                    : subTitle = transaction.describe;

                // transaction.authorizedUser == true
                //     ? time = transaction.nameOfUser! +
                //         transaction.dateTime.weekday.toString()
                //     : time = transaction.dateTime.weekday.toString();
                return ListTile(
                  isThreeLine: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title),
                      Text('\$${transaction.sum}'),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [Text(subTitle), Text('123')],
                      ),
                      Text('3%'),
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
