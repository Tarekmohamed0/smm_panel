import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/config/config.dart';
import '../../../../core/middleware/services_model.dart';
import '../../../../core/utils/auth_services.dart';

class ServicesState extends Equatable {
  final List<ServicesModel> selectedServices;

  const ServicesState({this.selectedServices = const []});

  ServicesState copyWith({List<ServicesModel>? selectedServices}) {
    return ServicesState(
      selectedServices: selectedServices ?? this.selectedServices,
    );
  }

  @override
  List<Object> get props => [selectedServices];
}

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(const ServicesState());

  void addService(ServicesModel service) async {
    final updatedList = List<ServicesModel>.from(state.selectedServices)
      ..add(service);

    emit(state.copyWith(selectedServices: updatedList));
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final data = state.selectedServices.map((e) => e.toJson()).toList();
    await firestore
        .collection('stores')
        .doc(sl<AuthServices>().currentUser!.uid)
        .update({
      'services': data,
    });
  }

  void removeService(ServicesModel service) {
    final updatedList = List<ServicesModel>.from(state.selectedServices)
      ..remove(service);
    emit(state.copyWith(selectedServices: updatedList));
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final data = state.selectedServices.map((e) => e.toJson()).toList();
    firestore
        .collection('stores')
        .doc(sl<AuthServices>().currentUser!.uid)
        .update({
      'services': data,
    });
  }
}
