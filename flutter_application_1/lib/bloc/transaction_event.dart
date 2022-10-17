part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent {}

class TransactionStartEvent extends TransactionEvent {}
