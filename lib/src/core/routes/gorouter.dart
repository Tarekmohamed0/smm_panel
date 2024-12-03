// إعداد الروتر باستخدام go_router

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smm_panel/src/features/create_store/data/models/store_model.dart';
import 'package:smm_panel/src/features/create_store/presentation/cubit/create_store_cubit.dart';
import 'package:smm_panel/src/features/signup/presentation/cubit/signup_cubit.dart';

import '../../features/create_store/presentation/pages/create_store_screen.dart';
import '../../features/create_store/presentation/pages/stores_screen.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/home/presentation/pages/merchant_home_screen.dart';
import '../../features/home/presentation/pages/merchant_store_services.dart';
import '../../features/login/presentation/cubit/cubit/merchant_cubit.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../../features/login/presentation/pages/login_screen.dart';
import '../../features/login/presentation/pages/select_type_screen.dart';
import '../../features/signup/presentation/pages/sign_up_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/MerchantHomeScreen', // مسار الصفحة الأولى
    routes: [
      GoRoute(
        path: '/LoginScreen',
        name: 'LoginScreen',
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/SignUpScreen',
        name: 'SignUpScreen',
        builder: (context, state) => BlocProvider(
          create: (context) => SignupCubit(),
          child: SignUpScreen(),
        ),
      ),
      GoRoute(
        path: '/SelectTypeScreen',
        name: 'SelectTypeScreen',
        builder: (context, state) => SelectTypeScreen(),
      ),
      GoRoute(
        path: '/HomeScreen',
        name: 'HomeScreen',
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(),
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: '/CreateStoreScreen',
        name: 'CreateStoreScreen',
        builder: (context, state) => BlocProvider(
          create: (context) => CreateStoreCubit(),
          child: CreateStoreScreen(),
        ),
      ),
      GoRoute(
        path: '/StoresScreen',
        name: 'StoresScreen',
        builder: (context, state) => BlocProvider(
          create: (context) => CreateStoreCubit(),
          child: StoresScreen(),
        ),
      ),
      GoRoute(
        path: '/MerchantHomeScreen',
        name: 'MerchantHomeScreen',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => MerchantCubit(),
            child: MerchantHomeScreen(),
          );
        },
      ),
      GoRoute(
          path: '/MerchantStoreServices',
          name: 'MerchantStoreServices',
          builder: (context, state) {
            final data = state.extra;
            return BlocProvider(
              create: (context) => MerchantCubit(),
              child: MerchantStoreServices(data: data),
            );
          }),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('404 - Page not found'),
      ),
    ),
  );
}
