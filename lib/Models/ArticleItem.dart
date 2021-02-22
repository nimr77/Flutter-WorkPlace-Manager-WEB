import 'package:flutter/cupertino.dart';

class ArticleItem {
  String articleId;
  String id;
  int quantity;
  double unitPrice;
  double price;
  String billId;
  int whenAdded;
  String articleName;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  ArticleItem({
    @required this.articleId,
    @required this.id,
    @required this.quantity,
    @required this.unitPrice,
    @required this.price,
    @required this.billId,
    @required this.whenAdded,
    @required this.articleName,
  });

  ArticleItem copyWith({
    String articleId,
    String id,
    int quantity,
    double unitPrice,
    double price,
    String billId,
    int whenAdded,
    String articleName,
  }) {
    return new ArticleItem(
      articleId: articleId ?? this.articleId,
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      price: price ?? this.price,
      billId: billId ?? this.billId,
      whenAdded: whenAdded ?? this.whenAdded,
      articleName: articleName ?? this.articleName,
    );
  }

  @override
  String toString() {
    return 'ArticleItem{articleId: $articleId, id: $id, quantity: $quantity, unitPrice: $unitPrice, price: $price, billId: $billId, whenAdded: $whenAdded, articleName: $articleName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleItem &&
          runtimeType == other.runtimeType &&
          articleId == other.articleId &&
          id == other.id &&
          quantity == other.quantity &&
          unitPrice == other.unitPrice &&
          price == other.price &&
          billId == other.billId &&
          whenAdded == other.whenAdded &&
          articleName == other.articleName);

  @override
  int get hashCode =>
      articleId.hashCode ^
      id.hashCode ^
      quantity.hashCode ^
      unitPrice.hashCode ^
      price.hashCode ^
      billId.hashCode ^
      whenAdded.hashCode ^
      articleName.hashCode;

  factory ArticleItem.fromMap(Map<String, dynamic> map) {
    return new ArticleItem(
      articleId: map['articleId'] as String,
      id: map['id'] as String,
      quantity: map['quantity'] as int,
      unitPrice: map['unitPrice'] as double,
      price: map['price'] as double,
      billId: map['billId'] as String,
      whenAdded: map['whenAdded'] as int,
      articleName: map['articleName'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'articleId': this.articleId,
      'id': this.id,
      'quantity': this.quantity,
      'unitPrice': this.unitPrice,
      'price': this.price,
      'billId': this.billId,
      'whenAdded': this.whenAdded,
      'articleName': this.articleName,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
