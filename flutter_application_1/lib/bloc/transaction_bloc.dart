import 'dart:js_util';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/transaction.dart';
import 'package:meta/meta.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionStartEvent>((event, emit) async {
      emit(TransactionLoading());
      await Future.delayed(Duration(seconds: 2))
          .then((value) => emit(TransactionLoaded()));
    });
  }
}
