import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/add_category_cuit/add_category_cubit.dart';

import 'package:flutter_ecatalog/bloc/add_product/add_product_bloc.dart';
import 'package:flutter_ecatalog/bloc/add_product_cubit/add_productc_cubit.dart';
import 'package:flutter_ecatalog/bloc/category_cubit/category_cubit.dart';
import 'package:flutter_ecatalog/bloc/edit_product/edit_product_bloc.dart';
import 'package:flutter_ecatalog/bloc/edit_product_cubit/edit_productc_cubit.dart';
import 'package:flutter_ecatalog/bloc/login_cubit/login_cubit.dart';
import 'package:flutter_ecatalog/bloc/navigation_cubit/navigation_cubit.dart';
import 'package:flutter_ecatalog/bloc/pagination_product/pagination_product_bloc.dart';
import 'package:flutter_ecatalog/bloc/products/products_bloc.dart';
import 'package:flutter_ecatalog/bloc/products_cubit/productsc_cubit.dart';
import 'package:flutter_ecatalog/bloc/register/register_bloc.dart';
import 'package:flutter_ecatalog/bloc/register_cubit/register_cubit_cubit.dart';
import 'package:flutter_ecatalog/data/datasources/auth_datasource.dart';
import 'package:flutter_ecatalog/data/datasources/category_datasource.dart';

import 'package:flutter_ecatalog/presentaton/splash_page.dart';
import 'package:flutter_ecatalog/themes/app_theme.dart';

import 'bloc/login/login_bloc.dart';
import 'data/datasources/product_datasource.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(ProductDataSource()),
        ),
        BlocProvider(
          create: (context) => AddProductBloc(ProductDataSource()),
        ),
        BlocProvider(
          create: (context) => EditProductBloc(ProductDataSource()),
        ),
        BlocProvider(
          create: (context) => PaginationProductBloc(ProductDataSource()),
        ),
        BlocProvider(
          create: (context) => RegisterCubitCubit(AuthDatasource()),
        ),
        BlocProvider(
          create: (context) => LoginCubit(AuthDatasource()),
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
