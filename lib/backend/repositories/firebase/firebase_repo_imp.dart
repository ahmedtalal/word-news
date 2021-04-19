import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:worldnews/backend/repositories/repository_model.dart';
import 'package:worldnews/models/user_model.dart';
import 'package:uuid/uuid.dart';

class FirebaseRepoImplement extends RepositoryModel {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  deleteData(model) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  getAllData(model) {
    // TODO: implement getAllData
    throw UnimplementedError();
  }

  @override
  getSpecialData(model) {
    // TODO: implement getSpecialData
    throw UnimplementedError();
  }

  @override
  updateData(model) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  Future<bool> register(UserModel userModel) async {
    bool result;
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
    if (credential != null) {
      result = await _insertUser(userModel);
    } else {
      result = false;
    }
    return result;
  }

  Future<bool> _insertUser(UserModel userModel) async {
    bool result = false;
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef = store.collection("Users");
    DocumentReference docRef = collRef.doc(userModel.id);
    await docRef.set(UserModel.toJson(userModel)).whenComplete(() {
      result = true;
    }).catchError((onError) {
      print("error in add user operation $onError");
      result = false;
    });
    return result;
  }

  Future<bool> login(UserModel userModel) async {
    bool result;
    UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
    if (credential != null) {
      result = true;
    } else {
      result = false;
    }
    return result;
  }

  @override
  addData(model) async {
    bool result = false;
    var uId = Uuid();
    Map<String,dynamic> data = UserModel.toJson(model);
    String userId = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef = store.collection("Favorites");
    DocumentReference docRef =
        collRef.doc(userId).collection("items").doc(uId.v1());
    await docRef.set(data).whenComplete(() {
      result = true;
    }).catchError((onError) => print(onError));
    return result;
  }
}
