import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/db_service.dart';

class FireStoreService implements DatabaseService {
  final firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      required String? docId}) async {
    if (docId == null) {
      await firestore.collection(path).add(data);
    } else {
      await firestore.collection(path).doc(docId).set(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId}) async {
    var result = await firestore.collection(path).doc(docId).get();
    return result.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docId}) async {
    var result = await firestore.collection(path).doc(docId).get();
    return result.exists;
  }
}
