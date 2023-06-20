import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.dart';
part 'navigation_cubit.freezed.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.initial());

  void currentIndex(int index) {
    emit(
      _$_NavigationIndex(
        index,
      ),
    );
    debugPrint('index : ${index.toString()}');
  }
}
