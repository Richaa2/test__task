import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/transaction.dart';
import 'package:flutter_application_1/transaction_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository transactionRepository;
  TransactionBloc({required this.transactionRepository})
      : super(TransactionInitial()) {
    on<TransactionStartEvent>((event, emit) async {
      emit(TransactionLoading());
      await Future.delayed(const Duration(seconds: 2)).then((value) =>
          emit(TransactionLoaded(transactionRepository.transactions)));
    });
  }
}
