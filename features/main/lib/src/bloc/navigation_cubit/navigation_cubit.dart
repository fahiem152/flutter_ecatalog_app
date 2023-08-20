import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

part 'navigation_state.dart';
part 'navigation_cubit.freezed.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState.initial());

  void currentIndex(int index) {
    emit(
      _$_NavigationIndex(
        index,
      ),
    );
    debugPrint('index : ${index.toString()}');
  }
}
