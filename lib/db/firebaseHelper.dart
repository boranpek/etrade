import 'dart:async';

import 'package:etrade/models/product.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseHelper {
  DatabaseReference firebaseReference;
  StreamSubscription<Event> dbFlow;
  FirebaseDatabase _db = FirebaseDatabase();
  DatabaseError error;

  static final FirebaseHelper _firebaseHelper = FirebaseHelper._internal();
  FirebaseHelper._internal();

  factory FirebaseHelper(){
    return _firebaseHelper;
  }

  Future<FirebaseDatabase> get db async {
    if(_db == null){
      _db = await initializeDb();
    }
    return _db;
  }

  initializeDb() async {
    firebaseReference = await _db.reference().child("Products");
    return firebaseReference;
  }


  insert(Product product) async {
    var result = await firebaseReference.push().set(product.toMap());
    return result;
  }

  getProducts(){

  }
}