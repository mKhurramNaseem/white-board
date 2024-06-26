import 'package:flutter/material.dart';
import 'package:white_board/states/color_states.dart';
import 'package:riverpod/riverpod.dart';

class ColorStateNotifier extends StateNotifier<ColorState> {
  ColorStateNotifier():super(const ColorInitialState(color: Colors.black,));

  updateColor(Color color){
    state = ColorUpdatedState(color: color);
  }
}