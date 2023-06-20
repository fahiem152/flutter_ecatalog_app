import 'package:flutter/material.dart';

import 'package:flutter_ecatalog/presentaton/login_page.dart';
import 'package:flutter_ecatalog/presentaton/main_page.dart';

import '../data/datasources/local_datasource.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void checkAuth() async {
    final auth = await LocalDatasource().getToken();
    await Future.delayed(const Duration(milliseconds: 1000));
    if (auth.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const MainPage();
          },
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
          },
        ),
      );
    }
  }

  @override
  void initState() {
    checkAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Text(
          'E-Catalog App',
          style: TextStyle(
            fontSize: 32,
            color: Theme.of(context).colorScheme.onPrimary,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
