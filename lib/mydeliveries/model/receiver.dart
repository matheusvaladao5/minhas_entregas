import 'package:cloud_firestore/cloud_firestore.dart';

class Receiver {
  String name;
  String address;
  String phone;
  double value;
  dynamic localization;

  DocumentReference? reference;

  Receiver(this.name, this.address, this.phone, this.value, this.localization);

  Receiver.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'],
        address = map['address'],
        phone = map['phone'],
        value = map['value'],
        localization = map['localization'];

  Receiver.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  Map<String, dynamic> toJson() => {
        "name": phone,
        "address": address,
        "phone": phone,
        "value": value,
        "localization": localization
      };
}
