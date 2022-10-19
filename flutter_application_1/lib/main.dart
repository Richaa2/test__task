import 'package:flutter/material.dart';
import 'package:flutter_application_1/transaction_repository.dart';

import 'package:flutter_application_1/transaction_screen/transactions_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/point_cubit/point_cubit.dart';
import 'bloc/transaction_bloc/transaction_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TransactionRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TransactionBloc(
                transactionRepository:
                    RepositoryProvider.of<TransactionRepository>(context)),
          ),
          BlocProvider(
            create: (context) => PointCubit(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade300),
          home: const TransactionsListScreen(),
        ),
      ),
    );
  }
}
