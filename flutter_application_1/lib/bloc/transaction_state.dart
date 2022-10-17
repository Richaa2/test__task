part of 'transaction_bloc.dart';

@immutable
abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<Transaction> transactions = [
    Transaction(
      nameOfUser: 'Diana',
      payment: false,
      sum: 14.06,
      name: 'Apple',
      describe: 'Card number used',
      pending: true,
      dateTime: DateTime.now().subtract(Duration(
        days: 100,
      )),
      authorizedUser: true,
      icon: Icons.apple,
    ),
    Transaction(
      payment: true,
      sum: 174.00,
      // name: 'Diana',
      describe: 'From another Bank',
      pending: false,
      dateTime: DateTime(2022, 3),
      authorizedUser: false,
      icon: Icons.apple,
    ),
    Transaction(
      nameOfUser: 'Diana',
      payment: false,
      sum: 3.24,
      name: 'Apple',
      describe: 'Card number used',
      pending: false,
      dateTime: DateTime.now(),
      authorizedUser: true,
      icon: Icons.apple,
    ),
    Transaction(
      payment: true,
      sum: 99.71,
      // name: 'Diana',
      describe: 'From another Bank',
      pending: false,
      dateTime: DateTime.now(),
      authorizedUser: false,
      icon: Icons.apple,
    ),
  ];
}
