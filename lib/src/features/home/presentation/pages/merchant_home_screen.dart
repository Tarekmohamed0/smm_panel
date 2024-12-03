import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smm_panel/src/features/create_store/data/models/store_model.dart';

import '../../../login/presentation/cubit/cubit/merchant_cubit.dart';

class MerchantHomeScreen extends StatelessWidget {
  MerchantHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black87,
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: FutureBuilder(
                  future: context.read<MerchantCubit>().getMerhcantStores(),
                  builder: (context, AsyncSnapshot snapshot) {
                    final store = snapshot.data;

                    if (snapshot.hasData) {
                      return ListView(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Go to store screen
                              GoRouter.of(context).go(
                                '/MerchantStoreServices',
                                extra: {'data': store},
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 400,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'اسم المتجر: ${store.storeName ?? 'لا يوجد اسم'}'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'الوصف: ${store.storeDescription ?? 'لا يوجد وصف'}'),
                                          // Text(
                                          //     'الخدمات المتاحة: ${store[index].services.length ?? 0}'),
                                          Text(
                                            maxLines: 1,
                                            'الخدمات المتاحه ${store.services.length ?? 0}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                overflow: TextOverflow.clip),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
