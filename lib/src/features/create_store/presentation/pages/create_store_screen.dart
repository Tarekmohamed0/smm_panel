import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smm_panel/src/core/utils/auth_services.dart';
import 'package:smm_panel/src/features/create_store/presentation/cubit/create_store_cubit.dart';

import '../../../../core/config/config.dart';

class CreateStoreScreen extends StatelessWidget {
  const CreateStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.refresh, color: Colors.blue)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          controller: context
                              .read<CreateStoreCubit>()
                              .storeNameController,
                          decoration: const InputDecoration(
                            labelText: 'Store Name',
                            hintText: 'Enter your store name',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: context
                              .read<CreateStoreCubit>()
                              .storeDescriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Store description',
                            hintText: 'Enter your store name',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CreateStoreCubit>().createStore(
                                storeName: context
                                    .read<CreateStoreCubit>()
                                    .storeNameController
                                    .text,
                                storeDescription: context
                                    .read<CreateStoreCubit>()
                                    .storeDescriptionController
                                    .text,
                                storeOwnerId:
                                    sl<AuthServices>().currentUser!.uid,
                                storeOwnerEmail:
                                    sl<AuthServices>().currentUser!.email!);
                          },
                          child: const Text('Create Store'),
                        ),
                      ],
                    )),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
