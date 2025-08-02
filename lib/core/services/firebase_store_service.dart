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
  Future<dynamic> getData(
      {required String path,
      String? docId,
      Map<String, dynamic>? qurey}) async {
    if (docId != null) {
      var result = await firestore.collection(path).doc(docId).get();
      return result.data() as Map<String, dynamic>;
    } else {
      var data = firestore.collection(path);
      if (qurey != null) {
        if (qurey['orderBy'] != null) {
          var orderByField = qurey['orderBy'];
          var descending = qurey['descending'];
          data.orderBy(orderByField, descending: descending);
        }
        if (qurey['limit'] != null) {
          var limit = qurey['limit'];
          data.limit(limit);
        }
      }
      var result = await data.get();

      return result.docs.map((item) => item.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docId}) async {
    var result = await firestore.collection(path).doc(docId).get();
    return result.exists;
  }
}
