import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smm_panel/src/core/utils/auth_services.dart';
import 'package:smm_panel/src/features/create_store/data/models/store_model.dart';
import 'package:smm_panel/src/features/login/presentation/cubit/cubit/merchant_state.dart';

import '../../../../../core/config/config.dart';

class MerchantCubit extends Cubit<MerchantState> {
  MerchantCubit() : super(MerchantState.initial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<StoreModel> getMerhcantStores() async {
    emit(const MerchantState.loading());
    try {
      final storeDoc = await _firestore
          .collection('stores')
          .doc(sl<AuthServices>().currentUser!.uid)
          .get();
      StoreModel? storeModell;
      if (storeDoc.exists) {
        final storeData = storeDoc.data();

        if (storeData != null) {
          storeModell = StoreModel.fromJson(storeData);
          print(storeModell); // أو يمكنك استخدام هذا الكائن في التطبيق
        } else {
          print('The document data is null.');
        }
      } else {
        print('The document does not exist.');
      }

      emit(const MerchantState.loaded());
      return storeModell ??
          StoreModel(
            storeName: '',
            storeDescription: '',
            storeOwnerId: '',
            storeOwnerEmail: '',
          );
    } catch (e) {
      emit(MerchantState.error(e.toString()));

      throw Exception('Failed to load merchant stores');
    }
  }
}
