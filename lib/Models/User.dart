import 'package:flutter/cupertino.dart';
import 'package:my_work_manager/Models/Persone.dart';

class User implements Person {
  List bills;
  List customers;
  double totalBalance;
  List operations;

  @override
  String email;

  @override
  String id;

  @override
  String name;

  @override
  String phoneNumber;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  User({
    @required this.bills,
    @required this.customers,
    @required this.totalBalance,
    @required this.operations,
    @required this.email,
    @required this.id,
    @required this.name,
    @required this.phoneNumber,
  });

  User copyWith({
    List bills,
    List customers,
    double totalBalance,
    List operations,
    String email,
    String id,
    String name,
    String phoneNumber,
  }) {
    return new User(
      bills: bills ?? this.bills,
      customers: customers ?? this.customers,
      totalBalance: totalBalance ?? this.totalBalance,
      operations: operations ?? this.operations,
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  String toString() {
    return 'User{bills: $bills, customers: $customers, totalBalance: $totalBalance, operations: $operations, email: $email, id: $id, name: $name, phoneNumber: $phoneNumber}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          bills == other.bills &&
          customers == other.customers &&
          totalBalance == other.totalBalance &&
          operations == other.operations &&
          email == other.email &&
          id == other.id &&
          name == other.name &&
          phoneNumber == other.phoneNumber);

  @override
  int get hashCode =>
      bills.hashCode ^
      customers.hashCode ^
      totalBalance.hashCode ^
      operations.hashCode ^
      email.hashCode ^
      id.hashCode ^
      name.hashCode ^
      phoneNumber.hashCode;

  factory User.fromMap(Map<String, dynamic> map) {
    return new User(
      bills: map['bills'] as List,
      customers: map['customers'] as List,
      totalBalance: map['totalBalance'] as double,
      operations: map['operations'] as List,
      email: map['email'] as String,
      id: map['id'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'bills': this.bills,
      'customers': this.customers,
      'totalBalance': this.totalBalance,
      'operations': this.operations,
      'email': this.email,
      'id': this.id,
      'name': this.name,
      'phoneNumber': this.phoneNumber,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
