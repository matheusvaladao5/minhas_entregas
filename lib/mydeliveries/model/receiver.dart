import 'package:cloud_firestore/cloud_firestore.dart';

class Receiver {
  String name;
  String address;
  String phone;
  String latitude;
  String longitude;

  DocumentReference? reference;

  Receiver(this.name, this.address, this.phone, this.latitude, this.longitude);

  Receiver.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'],
        address = map['address'],
        phone = map['phone'],
        latitude = map['latitude'],
        longitude = map['longitude'];

  Receiver.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);
}