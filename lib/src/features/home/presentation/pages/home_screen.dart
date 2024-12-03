import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smm_panel/src/core/config/config.dart';
import 'package:smm_panel/src/core/constants/constants.dart';
import 'package:smm_panel/src/core/middleware/services_model.dart';
import 'package:smm_panel/src/core/services/api_services.dart';
import 'package:smm_panel/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:smm_panel/src/features/home/presentation/cubit/home_state.dart';

import '../widgets/bottomshet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  bool isSelected = false;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
  }

  void _refresh() async {
    await context.read<HomeCubit>().getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is Loading || current is Loaded || current is Error,
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (services) {
                return Column(children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.refresh, color: Colors.blue)),
                    ],
                  ),
                  BlocProvider(
                    create: (context) => HomeCubit(),
                    child: Bottomshet(services: services),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push('/CreateStoreScreen');
                    },
                    child: const Text('create store'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push('/StoresScreen');
                    },
                    child: const Text('Stores'),
                  ),
                ]);
              },
              error: (message) => Center(
                child: Text(message),
              ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}

bool isSelected = false;
void showServicePicker(BuildContext context, List<ServicesModel> services) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is Loaded) {
            return ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                // final isSelected = selectedServices.contains(service);

                return ListTile(
                  title: Text(service.serviceName),
                  subtitle: Text(service.category),
                  trailing: Icon(
                    isSelected
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                  ),
                  onTap: () {
                    isSelected = !isSelected;
                    if (isSelected) {
                      context.read<HomeCubit>().addService(service);
                    } else {
                      context.read<HomeCubit>().removeService(service);
                    }
                    ;
                  },
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    },
  );
}
