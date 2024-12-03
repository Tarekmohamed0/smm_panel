import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smm_panel/src/core/utils/auth_services.dart';

import '../../../../core/config/config.dart';

class CreateStoreDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createStore(
      {required String storeName,
      required String storeDescription,
      required String storeOwnerId,
      required String storeOwnerEmail}) async {
    final storeCollection = firestore.collection('stores');
    await storeCollection.doc(sl<AuthServices>().currentUser!.uid).set({
      'storeName': storeName,
      'storeDescription': storeDescription,
      'storeOwnerId': storeOwnerId,
      'storeOwnerEmail': storeOwnerEmail,
      'services': [],
    });
  }
}
