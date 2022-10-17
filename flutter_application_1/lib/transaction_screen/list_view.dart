import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/transaction_bloc.dart';
import 'package:flutter_application_1/models/transaction.dart';
import 'package:flutter_application_1/transaction_screen/list_tile.dart';
import 'package:flutter_application_1/transaction_screen/list_view_widget.dart';
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
    return BlocBuilder<TransactionBloc, TransactionState>(
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
              height: 520,
              child: ListViewWidget(state: state));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
