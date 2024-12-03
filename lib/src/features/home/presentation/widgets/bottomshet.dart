import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smm_panel/src/features/home/presentation/cubit/services_cubit.dart';
import '../../../../core/middleware/services_model.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class Bottomshet extends StatelessWidget {
  const Bottomshet({super.key, required this.services});
  final List<ServicesModel> services;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesCubit(),
      child: ElevatedButton(
        onPressed: () => _showBottomSheet(context, services),
        child: const Text('Show Bottom Sheet'),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, List<ServicesModel> services) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => ServicesCubit(),
          child: ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return BlocBuilder<ServicesCubit, ServicesState>(
                builder: (context, state) {
                  final isSelected = state.selectedServices.contains(service);

                  return ListTile(
                    title: Text(service.serviceName),
                    subtitle: Text(service.category),
                    trailing: Icon(
                      isSelected
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                    ),
                    onTap: () {
                      if (isSelected) {
                        context.read<ServicesCubit>().removeService(service);
                      } else {
                        context.read<ServicesCubit>().addService(service);
                      }
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
