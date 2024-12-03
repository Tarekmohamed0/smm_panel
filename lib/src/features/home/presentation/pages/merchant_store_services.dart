import 'package:flutter/material.dart';
import 'package:smm_panel/src/features/create_store/data/models/store_model.dart';

class MerchantStoreServices extends StatelessWidget {
  MerchantStoreServices({super.key, required this.data});
  final data;

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
                child: ListView.builder(
                    itemCount: data['data'].services.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Go to store screen
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      data['data'].services[index].serviceName),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'السعر لكل الف: ${data['data'].services[index].rate}'),
                                      Text(
                                          'التصنيف: ${data['data'].services[index].category}'),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
