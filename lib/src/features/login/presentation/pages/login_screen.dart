import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smm_panel/src/features/login/presentation/cubit/login_state.dart';

import '../cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  List role = ['merchant', 'User'];
  String selectedValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) =>
            current is Loading || current is Error || current is LoggedIn,
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              // Show loading dialog
            },
            error: (message) {
              // Show error dialog
            },
            loggedIn: (user, role) {
              // Navigate to home screen
              role == 'merchant'
                  ? GoRouter.of(context).go('/MerchantHomeScreen')
                  : GoRouter.of(context).go('/HomeScreen');
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    const Text('Login'),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: context.read<LoginCubit>().emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                    const SizedBox(height: 20),
                    // DropdownButtonFormField2<String>(
                    //   isExpanded: true,
                    //   decoration: InputDecoration(
                    //     // Add Horizontal padding using menuItemStyleData.padding so it matches
                    //     // the menu padding when button's width is not specified.
                    //     contentPadding:
                    //         const EdgeInsets.symmetric(vertical: 16),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(15),
                    //     ),
                    //     // Add more decoration..
                    //   ),
                    //   hint: const Text(
                    //     'Select Your Gender',
                    //     style: TextStyle(fontSize: 14),
                    //   ),
                    //   items: role
                    //       .map((item) => DropdownMenuItem<String>(
                    //             value: item,
                    //             child: Text(
                    //               item,
                    //               style: const TextStyle(
                    //                 fontSize: 14,
                    //               ),
                    //             ),
                    //           ))
                    //       .toList(),
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return 'Please select gender.';
                    //     }
                    //     return null;
                    //   },
                    //   onChanged: (value) {
                    //     //Do something when selected item is changed.
                    //     selectedValue = value.toString();
                    //     print(selectedValue);
                    //   },
                    //   onSaved: (value) {
                    //     selectedValue = value.toString();
                    //   },
                    //   buttonStyleData: const ButtonStyleData(
                    //     padding: EdgeInsets.only(right: 8),
                    //   ),
                    //   iconStyleData: const IconStyleData(
                    //     icon: Icon(
                    //       Icons.arrow_drop_down,
                    //       color: Colors.black45,
                    //     ),
                    //     iconSize: 24,
                    //   ),
                    //   dropdownStyleData: DropdownStyleData(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //     ),
                    //   ),
                    //   menuItemStyleData: const MenuItemStyleData(
                    //     padding: EdgeInsets.symmetric(horizontal: 16),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: context.read<LoginCubit>().passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () async {
                        // Login logic
                        try {
                          await context.read<LoginCubit>().login(
                                email: context
                                    .read<LoginCubit>()
                                    .emailController
                                    .text,
                                password: context
                                    .read<LoginCubit>()
                                    .passwordController
                                    .text,
                                role: selectedValue,
                              );
                          await context.read<LoginCubit>().savedata(
                                context.read<LoginCubit>().emailController.text,
                                context
                                    .read<LoginCubit>()
                                    .passwordController
                                    .text,
                                selectedValue,
                              );
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
