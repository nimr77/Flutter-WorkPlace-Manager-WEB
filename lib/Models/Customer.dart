import 'package:flutter/cupertino.dart';
import 'package:my_work_manager/Models/Persone.dart';

class Customer implements Person {
  List allBills;
  List paidBills;
  double amountOfWhatNeedToBePaidNow;
  List currentBills;
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

  Customer({
    @required this.allBills,
    @required this.paidBills,
    @required this.amountOfWhatNeedToBePaidNow,
    @required this.currentBills,
    @required this.operations,
    @required this.email,
    @required this.id,
    @required this.name,
    @required this.phoneNumber,
  });

  Customer copyWith({
    List allBills,
    List paidBills,
    double amountOfWhatNeedToBePaidNow,
    List currentBills,
    List operations,
    String email,
    String id,
    String name,
    String phoneNumber,
  }) {
    return new Customer(
      allBills: allBills ?? this.allBills,
      paidBills: paidBills ?? this.paidBills,
      amountOfWhatNeedToBePaidNow:
          amountOfWhatNeedToBePaidNow ?? this.amountOfWhatNeedToBePaidNow,
      currentBills: currentBills ?? this.currentBills,
      operations: operations ?? this.operations,
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  String toString() {
    return 'Customer{allBills: $allBills, paidBills: $paidBills, amountOfWhatNeedToBePaidNow: $amountOfWhatNeedToBePaidNow, currentBills: $currentBills, operations: $operations, email: $email, id: $id, name: $name, phoneNumber: $phoneNumber}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          runtimeType == other.runtimeType &&
          allBills == other.allBills &&
          paidBills == other.paidBills &&
          amountOfWhatNeedToBePaidNow == other.amountOfWhatNeedToBePaidNow &&
          currentBills == other.currentBills &&
          operations == other.operations &&
          email == other.email &&
          id == other.id &&
          name == other.name &&
          phoneNumber == other.phoneNumber);

  @override
  int get hashCode =>
      allBills.hashCode ^
      paidBills.hashCode ^
      amountOfWhatNeedToBePaidNow.hashCode ^
      currentBills.hashCode ^
      operations.hashCode ^
      email.hashCode ^
      id.hashCode ^
      name.hashCode ^
      phoneNumber.hashCode;

  factory Customer.fromMap(Map<String, dynamic> map) {
    return new Customer(
      allBills: map['allBills'] as List,
      paidBills: map['paidBills'] as List,
      amountOfWhatNeedToBePaidNow: map['amountOfWhatNeedToBePaidNow'] as double,
      currentBills: map['currentBills'] as List,
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
      'allBills': this.allBills,
      'paidBills': this.paidBills,
      'amountOfWhatNeedToBePaidNow': this.amountOfWhatNeedToBePaidNow,
      'currentBills': this.currentBills,
      'operations': this.operations,
      'email': this.email,
      'id': this.id,
      'name': this.name,
      'phoneNumber': this.phoneNumber,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
