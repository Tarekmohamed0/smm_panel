import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smm_panel/src/features/create_store/data/models/store_model.dart';
import 'package:smm_panel/src/features/create_store/domain/usecases/create_store_usecase.dart';
import 'package:smm_panel/src/features/create_store/presentation/cubit/create_store_state.dart';

class CreateStoreCubit extends Cubit<CreateStoreState> {
  CreateStoreCubit() : super(CreateStoreState.initial());

  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController storeDescriptionController =
      TextEditingController();
  final CreateStoreUsecase _createStoreUsecase = CreateStoreUsecase();

  Future<void> createStore({
    required String storeName,
    required String storeDescription,
    required String storeOwnerId,
    required String storeOwnerEmail,
  }) async {
    emit(const CreateStoreState.loading());
    try {
      final store = await _createStoreUsecase.call(
          storeName: storeName,
          storeDescription: storeDescription,
          storeOwnerId: storeOwnerId,
          storeOwnerEmail: storeOwnerEmail);
      store.fold(
          (l) => emit(CreateStoreState.error(l.message)),
          (r) => emit(CreateStoreState.loaded(
                "$storeName Store created successfully",
              )));
    } on Exception catch (e) {
      emit(CreateStoreState.error(e.toString()));
    }
  }

  Future<List<StoreModel>> getStores() async {
    emit(const CreateStoreState.loading());

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('stores').get();

      if (querySnapshot.docs.isNotEmpty) {
        final stores = querySnapshot.docs.map((doc) {
          return StoreModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
        print('Fetching stores...');
        print('Documents Count: ${querySnapshot.docs.length}');
        print('First Document: ${querySnapshot.docs.first.data()}');
        emit(CreateStoreState.stores(stores));
        return stores;
      } else {
        emit(const CreateStoreState.error('No stores found.'));
      }
    } catch (e) {
      emit(CreateStoreState.error('Error fetching stores: $e'));
    }
    return [];
  }
}
