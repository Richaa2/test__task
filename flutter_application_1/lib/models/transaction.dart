import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Transaction {
  final bool payment;
  final double sum;
  final String? name;
  final String describe;
  final bool pending;
  final DateTime dateTime;
  final bool authorizedUser;
  final IconData icon;
  final String? nameOfUser;

  Transaction({
    required this.payment,
    required this.sum,
    this.name,
    required this.describe,
    required this.pending,
    required this.dateTime,
    required this.authorizedUser,
    required this.icon,
    this.nameOfUser,
  });
}
