import 'package:flutter/cupertino.dart';

class Bill {
  String id;
  double total;
  List<String> items;
  double paid;
  String customer;
  int when;
  int whenLastPaid;
  bool isBeenClosed;
  int whenItShouldBeClose;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Bill({
    @required this.id,
    @required this.total,
    @required this.items,
    @required this.paid,
    @required this.customer,
    @required this.when,
    @required this.whenLastPaid,
    @required this.isBeenClosed,
    @required this.whenItShouldBeClose,
  });

  Bill copyWith({
    String id,
    double total,
    List<String> items,
    double paid,
    String customer,
    int when,
    int whenLastPaid,
    bool isBeenClosed,
    int whenItShouldBeClose,
  }) {
    return new Bill(
      id: id ?? this.id,
      total: total ?? this.total,
      items: items ?? this.items,
      paid: paid ?? this.paid,
      customer: customer ?? this.customer,
      when: when ?? this.when,
      whenLastPaid: whenLastPaid ?? this.whenLastPaid,
      isBeenClosed: isBeenClosed ?? this.isBeenClosed,
      whenItShouldBeClose: whenItShouldBeClose ?? this.whenItShouldBeClose,
    );
  }

  @override
  String toString() {
    return 'Bill{id: $id, total: $total, items: $items, paid: $paid, customer: $customer, when: $when, whenLastPaid: $whenLastPaid, isBeenClosed: $isBeenClosed, whenItShouldBeClose: $whenItShouldBeClose}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bill &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          total == other.total &&
          items == other.items &&
          paid == other.paid &&
          customer == other.customer &&
          when == other.when &&
          whenLastPaid == other.whenLastPaid &&
          isBeenClosed == other.isBeenClosed &&
          whenItShouldBeClose == other.whenItShouldBeClose);

  @override
  int get hashCode =>
      id.hashCode ^
      total.hashCode ^
      items.hashCode ^
      paid.hashCode ^
      customer.hashCode ^
      when.hashCode ^
      whenLastPaid.hashCode ^
      isBeenClosed.hashCode ^
      whenItShouldBeClose.hashCode;

  factory Bill.fromMap(Map<String, dynamic> map) {
    return new Bill(
      id: map['id'] as String,
      total: map['total'] as double,
      items: map['items'] as List<String>,
      paid: map['paid'] as double,
      customer: map['customer'] as String,
      when: map['when'] as int,
      whenLastPaid: map['whenLastPaid'] as int,
      isBeenClosed: map['isBeenClosed'] as bool,
      whenItShouldBeClose: map['whenItShouldBeClose'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'total': this.total,
      'items': this.items,
      'paid': this.paid,
      'customer': this.customer,
      'when': this.when,
      'whenLastPaid': this.whenLastPaid,
      'isBeenClosed': this.isBeenClosed,
      'whenItShouldBeClose': this.whenItShouldBeClose,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
