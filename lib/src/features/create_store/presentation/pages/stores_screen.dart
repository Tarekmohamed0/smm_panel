import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smm_panel/src/features/create_store/presentation/cubit/create_store_cubit.dart';

import '../../data/models/store_model.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  _StoresScreenState createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  late Future<List<StoreModel>> storesFuture;

  @override
  void initState() {
    super.initState();
    storesFuture = context.read<CreateStoreCubit>().getStores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: storesFuture,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return const Center(child: Text('No stores available'));
          }

          final store = snapshot.data;
          return ListView.builder(
            itemCount: store.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'اسم المتجر: ${store[index].storeName ?? 'لا يوجد اسم'}'),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'الوصف: ${store[index].storeDescription ?? 'لا يوجد وصف'}'),
                            Text(
                                'الخدمات المتاحة: ${store[index].services.length ?? 0}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
