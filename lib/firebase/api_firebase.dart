//---- Packages
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

//---- Variables

DatasUser dataUser = DatasUser();

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

var user;

//---- Class LocalUser

class LocalUser {
  Future<File> getData() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future readData() async {
    final file = await getData();
    user = await jsonDecode(file.readAsStringSync());
    return user;
  }

  Future deleteData() async {
    final directory = await getData();
    await directory.delete();
  }
}

//---- Class DatasUser

class DatasUser {
  Future getDataUser() async {
    print("getDataUser id: ${FirebaseAuth.instance.currentUser.uid}");
    return user = await firebaseFirestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
  }

  Future addUser(dataUser) async {
    print("AddUser: $dataUser");
    await firebaseFirestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .set(dataUser);
  }

  Future setDataUser() async {
    DocumentSnapshot dataUser = await getDataUser();
    print(dataUser.exists);
    user = dataUser.data();
    print("setDataUser: ${dataUser.data()}");
    return user;
  }

}