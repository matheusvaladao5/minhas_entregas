import 'package:cloud_firestore/cloud_firestore.dart';

class Delivery {
  String product;
  String brand;
  double weight;
  double? rate;
  dynamic receiver;
  DateTime initialDate;
  DateTime finalDate;
  bool paid;
  String status;

  DocumentReference? reference;

  Delivery(this.product, this.brand, this.weight, this.rate, this.receiver,
      this.initialDate, this.finalDate, this.paid, this.status);

  Delivery.fromMap(Map<String, dynamic> map, {this.reference})
      : product = map['product'],
        brand = map['brand'],
        weight = map['weight'],
        rate = map['rate'],
        receiver = map['receiver'],
        initialDate = map['initialDate'].toDate(),
        finalDate = map['finalDate'].toDate(),
        paid = map['paid'],
        status = map['status'];

  Delivery.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  Map<String, dynamic> toJson() => {
        "product": product,
        "brand": brand,
        "weight": weight,
        "rate": rate,
        "receiver": receiver,
        "initialDate": initialDate,
        "finalDate": finalDate,
        "paid": paid,
        "status": status
      };
}
