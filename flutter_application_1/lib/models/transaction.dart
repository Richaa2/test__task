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

  Transaction copyWith({
    bool? payment,
    double? sum,
    String? name,
    String? describe,
    bool? pending,
    DateTime? dateTime,
    bool? authorizedUser,
    IconData? icon,
  }) {
    return Transaction(
      payment: payment ?? this.payment,
      sum: sum ?? this.sum,
      name: name ?? this.name,
      describe: describe ?? this.describe,
      pending: pending ?? this.pending,
      dateTime: dateTime ?? this.dateTime,
      authorizedUser: authorizedUser ?? this.authorizedUser,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'Payment': payment});
    result.addAll({'sum': sum});
    result.addAll({'name': name});
    result.addAll({'describe': describe});
    result.addAll({'pending': pending});
    result.addAll({'dateTime': dateTime.millisecondsSinceEpoch});
    result.addAll({'authorizedUser': authorizedUser});
    result.addAll({'icon': icon.codePoint});

    return result;
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      payment: map['Payment'] ?? false,
      sum: map['sum']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      describe: map['describe'] ?? '',
      pending: map['pending'] ?? false,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      authorizedUser: map['authorizedUser'] ?? false,
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Transaction(Payment: $payment, sum: $sum, name: $name, describe: $describe, pending: $pending, dateTime: $dateTime, authorizedUser: $authorizedUser, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.payment == payment &&
        other.sum == sum &&
        other.name == name &&
        other.describe == describe &&
        other.pending == pending &&
        other.dateTime == dateTime &&
        other.authorizedUser == authorizedUser &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return payment.hashCode ^
        sum.hashCode ^
        name.hashCode ^
        describe.hashCode ^
        pending.hashCode ^
        dateTime.hashCode ^
        authorizedUser.hashCode ^
        icon.hashCode;
  }
}
