import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smm_panel/src/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:smm_panel/src/features/signup/presentation/cubit/signup_state.dart';

import '../../../login/presentation/cubit/login_cubit.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  String selectedValue = '';
  List role = ['merchant', 'User'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<SignupCubit, SignupState>(
          listenWhen: (previous, current) =>
              current is Loading ||
              current is UnAuthenticated ||
              current is Authenticated,
          listener: (context, state) {
            state.whenOrNull(
              loading: () {
                // Show loading dialog
              },
              unauthenticated: (message) {
                // Show error dialog
              },
              authenticated: (user) {
                // Navigate to home screen
                GoRouter.of(context).go('/LoginScreen');
              },
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                Center(
                  child: Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 100),
                      child: Column(
                        children: [
                          const Text('Login'),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller:
                                context.read<SignupCubit>().emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                            ),
                          ),
                          const SizedBox(height: 20),
                          DropdownButtonFormField2<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                              // Add Horizontal padding using menuItemStyleData.padding so it matches
                              // the menu padding when button's width is not specified.
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // Add more decoration..
                            ),
                            hint: const Text(
                              'Select Your Gender',
                              style: TextStyle(fontSize: 14),
                            ),
                            items: role
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select gender.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              //Do something when selected item is changed.
                              selectedValue = value.toString();
                              print(selectedValue);
                            },
                            onSaved: (value) {
                              selectedValue = value.toString();
                            },
                            buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(right: 8),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 24,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller:
                                context.read<SignupCubit>().passwordController,
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
                                await context.read<SignupCubit>().signUp(
                                      email: context
                                          .read<SignupCubit>()
                                          .emailController
                                          .text,
                                      password: context
                                          .read<SignupCubit>()
                                          .passwordController
                                          .text,
                                      role: selectedValue,
                                    );
                                await context.read<SignupCubit>().savedata(
                                      context
                                          .read<SignupCubit>()
                                          .emailController
                                          .text,
                                      context
                                          .read<SignupCubit>()
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
