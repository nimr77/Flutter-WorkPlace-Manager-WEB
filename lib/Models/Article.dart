import 'package:flutter/cupertino.dart';

class Article {
  String id;
  String userID;
  String name;
  double pricePerUnit;
  double pricePerKilo;
  double pricePerMeter;
  int quantityInStock;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Article({
    @required this.id,
    @required this.userID,
    @required this.name,
    @required this.pricePerUnit,
    @required this.pricePerKilo,
    @required this.pricePerMeter,
    @required this.quantityInStock,
  });

  Article copyWith({
    String id,
    String userID,
    String name,
    double pricePerUnit,
    double pricePerKilo,
    double pricePerMeter,
    int quantityInStock,
  }) {
    return new Article(
      id: id ?? this.id,
      userID: userID ?? this.userID,
      name: name ?? this.name,
      pricePerUnit: pricePerUnit ?? this.pricePerUnit,
      pricePerKilo: pricePerKilo ?? this.pricePerKilo,
      pricePerMeter: pricePerMeter ?? this.pricePerMeter,
      quantityInStock: quantityInStock ?? this.quantityInStock,
    );
  }

  @override
  String toString() {
    return 'Article{id: $id, userID: $userID, name: $name, pricePerUnit: $pricePerUnit, pricePerKilo: $pricePerKilo, pricePerMeter: $pricePerMeter, quantityInStock: $quantityInStock}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userID == other.userID &&
          name == other.name &&
          pricePerUnit == other.pricePerUnit &&
          pricePerKilo == other.pricePerKilo &&
          pricePerMeter == other.pricePerMeter &&
          quantityInStock == other.quantityInStock);

  @override
  int get hashCode =>
      id.hashCode ^
      userID.hashCode ^
      name.hashCode ^
      pricePerUnit.hashCode ^
      pricePerKilo.hashCode ^
      pricePerMeter.hashCode ^
      quantityInStock.hashCode;

  factory Article.fromMap(Map<String, dynamic> map) {
    return new Article(
      id: map['id'] as String,
      userID: map['userID'] as String,
      name: map['name'] as String,
      pricePerUnit: map['pricePerUnit'] as double,
      pricePerKilo: map['pricePerKilo'] as double,
      pricePerMeter: map['pricePerMeter'] as double,
      quantityInStock: map['quantityInStock'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'userID': this.userID,
      'name': this.name,
      'pricePerUnit': this.pricePerUnit,
      'pricePerKilo': this.pricePerKilo,
      'pricePerMeter': this.pricePerMeter,
      'quantityInStock': this.quantityInStock,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
