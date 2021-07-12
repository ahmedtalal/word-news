import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:worldnews/backend/repositories/repository_model.dart';
import 'package:worldnews/models/news_model.dart';
import 'package:worldnews/models/user_model.dart';
import 'package:uuid/uuid.dart';

class FirebaseRepoImplement extends RepositoryModel {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  addData(model) async {
    bool result = false;
    var uId = Uuid();
    Map<String, dynamic> data = NewsModel.toJson(model);
    String userId = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef = store.collection("Favorites");
    DocumentReference docRef =
        collRef.doc(userId).collection("items").doc(model.id);
    await docRef.set(data).whenComplete(() {
      result = true;
    }).catchError((onError) => print(onError));
    return result;
  }

  @override
  deleteData(model) {
    bool result = false;
    String userId = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef = store.collection("Favorites");
    DocumentReference docRef =
        collRef.doc(userId).collection("items").doc(model);
    docRef.delete().whenComplete(() {
      result = true;
    });
    return result;
  }

  @override
  getAllData(model) {
    String userId = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef =
        store.collection("Favorites").doc(userId).collection("items");
    return collRef.snapshots();
  }

  @override
  getSpecialData(model) {
    String userId = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore store = FirebaseFirestore.instance;
    DocumentReference docRef = store.collection("Users").doc(userId);
    return docRef.snapshots();
  }

  @override
  updateData(model) {
    bool result = false;
    Map<String, dynamic> data = {
      "num": model["num"]++,
    };
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef = store.collection("itemViews");
    DocumentReference docRef = collRef.doc(model["id"]);
    docRef.update(data).whenComplete(() {
      result = true;
    });
    return result;
  }

  Future<bool> register(UserModel userModel) async {
    bool result;
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
    if (credential != null) {
      var model = UserModel.object(id: userModel.id, name: userModel.name, email: userModel.email);
      result = await _insertUser(model);
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

  Future<bool> setNumOfViews(var id) async {
    bool result = false;
    Map<String, dynamic> data = {
      "num": 1,
    };
    FirebaseFirestore store = FirebaseFirestore.instance;
    CollectionReference collRef = store.collection("itemViews");
    DocumentReference docRef = collRef.doc(id);
    await docRef.set(data).whenComplete(() {
      result = true;
    });
    return result;
  }

  getItemViews(var id) {
    String userId = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore store = FirebaseFirestore.instance;
    DocumentReference docRef = store.collection("itemViews").doc(id);
    return docRef.snapshots();
  }

  checkCurrentUser() {
    bool result = false;
    User user = _auth.currentUser;
    if (user != null) {
      result = true;
    } else {
      result = false;
    }
    return result;
  }
}
