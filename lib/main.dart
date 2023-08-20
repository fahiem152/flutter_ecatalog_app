import 'package:category/category.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ecatalog/themes/app_theme.dart';

import 'package:dependencies/dependencies.dart';

import 'package:auth/auth.dart';
import 'package:main/main.dart';
import 'package:home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => RegisterBloc(AuthRemoteDatasource()),
        // ),
        // BlocProvider(
        //   create: (context) => LoginBloc(AuthRemoteDatasource()),
        // ),
        // BlocProvider(
        //   create: (context) => ProductsBloc(ProductDataSource()),
        // ),
        BlocProvider(
          create: (context) => AddProductBloc(ProductDataSource()),
        ),
        // BlocProvider(
        //   create: (context) => EditProductBloc(ProductDataSource()),
        // ),
        // BlocProvider(
        //   create: (context) => PaginationProductBloc(ProductDataSource()),
        // ),
        BlocProvider(
          create: (context) => RegisterCubitCubit(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LoginCubit(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ProductscCubit(ProductDataSource()),
        ),
        BlocProvider(
          create: (context) => AddProductcCubit(ProductDataSource()),
        ),
        BlocProvider(
          create: (context) => EditProductcCubit(ProductDataSource()),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(CategoryDataSource()),
        ),
        BlocProvider(
          create: (context) => AddCategoryCubit(CategoryDataSource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.dark,
        home: const SplashPage(),
      ),
    );
  }
}
