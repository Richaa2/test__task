import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/cubit/point_cubit.dart';
import 'package:flutter_application_1/transaction_screen/transactions_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/transaction_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransactionBloc(),
        ),
        BlocProvider(
          create: (context) => PointCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade200),
        home: TransactionsListScreen(),
      ),
    );
  }
}
