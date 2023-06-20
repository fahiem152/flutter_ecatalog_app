import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/presentaton/category_page.dart';
import 'package:flutter_ecatalog/presentaton/home_page.dart';
import 'package:flutter_ecatalog/presentaton/profile_page.dart';

import '../bloc/navigation_cubit/navigation_cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<NavigationCubit>().currentIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    Widget bottomNavigationBar() {
      return BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            onTap: (index) {
              context.read<NavigationCubit>().currentIndex(index);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: state.maybeMap(
                  navigationIndex: (value) => value.index == 0 ? 'Home' : '',
                  orElse: () => '',
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.format_list_bulleted),
                label: state.maybeMap(
                  navigationIndex: (value) =>
                      value.index == 1 ? 'Category' : '',
                  orElse: () => '',
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: state.maybeMap(
                  navigationIndex: (value) => value.index == 2 ? 'Profile' : '',
                  orElse: () => '',
                ),
              ),
            ],
            currentIndex: state.maybeMap(
              navigationIndex: (value) => value.index,
              orElse: () => 0,
            ),
          );
        },
      );
    }

    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: SafeArea(child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.maybeMap(
              navigationIndex: (value) => value.index,
              orElse: () => 0,
            ),
            children: const [
              HomePage(),
              CategoryPage(),
              ProfilePage(),
            ],
          );
        },
      )),
    );
  }
}
