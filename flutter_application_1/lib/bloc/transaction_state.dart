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
      dateTime: DateTime.now(),
      authorizedUser: true,
      icon: Icons.apple,
    ),
    Transaction(
      nameOfUser: 'Diana',
      payment: false,
      sum: 14.06,
      name: 'Apple',
      describe: 'Card number used',
      pending: true,
      dateTime: DateTime.now().subtract(Duration(hours: 23)),
      authorizedUser: true,
      icon: Icons.apple,
    ),
    Transaction(
      nameOfUser: 'Diana',
      payment: false,
      sum: 14.06,
      name: 'Apple',
      describe: 'Card number used',
      pending: true,
      dateTime: DateTime.now().subtract(Duration(days: 1)),
      authorizedUser: true,
      icon: Icons.apple,
    ),
    Transaction(
      payment: true,
      sum: 174.00,
      // name: 'Diana',
      describe: 'From another Bank',
      pending: false,
      dateTime: DateTime.now().subtract(Duration(days: 2)),
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
      dateTime: DateTime.now().subtract(Duration(days: 7)),
      authorizedUser: true,
      icon: Icons.apple,
    ),
    Transaction(
      payment: true,
      sum: 99.71,
      // name: 'Diana',
      describe: 'From another Bank',
      pending: false,
      dateTime: DateTime.now().subtract(Duration(days: 10)),
      authorizedUser: false,
      icon: Icons.apple,
    ),
  ];
}
