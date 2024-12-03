import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SelectTypeScreen extends StatelessWidget {
  SelectTypeScreen({super.key});
  List role = ['merchant', 'User'];
  String selectedValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Select Type'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {
              // Select Type logic
            },
            child: const Text('Select Type'),
          ),
        ],
      ),
    );
  }
}
