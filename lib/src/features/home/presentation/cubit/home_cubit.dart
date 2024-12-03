import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smm_panel/src/core/config/config.dart';
import 'package:smm_panel/src/core/middleware/services_model.dart';
import 'package:smm_panel/src/core/services/api_services.dart';
import 'package:smm_panel/src/core/utils/auth_services.dart';
import 'package:smm_panel/src/features/home/presentation/cubit/home_state.dart';

import '../../../../core/constants/constants.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  final ApiServices _apiServices = sl<ApiServices>();

  Future<List<ServicesModel>> getServices() async {
    emit(const HomeState.loading());
    try {
      final services = await _apiServices.getServices(
        Constant.apiToken,
        'services',
      );
      emit(HomeState.loaded(services));
    } on DioException catch (e) {
      emit(HomeState.error("Error loading services"));
    }
    return [];
  }

  // Add service to the selected list
  void addService(ServicesModel service) {
    List<ServicesModel> currentList = [];
    currentList.add(service);
    emit(HomeState.services(currentList));
  }

  // Remove service from the selected list
  void removeService(ServicesModel service) {
    List<ServicesModel> currentList = [];
    currentList.remove(service);
    emit(HomeState.services(currentList));
  }

  // Save selected services to Firebase
  Future<void> saveToFirebase() async {
    final firestore = FirebaseFirestore.instance;
    final data = state.maybeWhen(
      services: (services) => services.map((e) => e.toJson()).toList(),
      orElse: () => [],
    );

    await firestore
        .collection('stores')
        .doc(sl<AuthServices>().currentUser!.uid)
        .update({
      'services': data,
    });
  }
}
