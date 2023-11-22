import 'package:flutter/material.dart';
import 'package:nativelocation/model/place.dart';
import 'package:riverpod/riverpod.dart';

class UserNotifier extends StateNotifier<List<Place>> {
  UserNotifier() : super(const []);

  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [newPlace, ...state];
  }
}

final UserPlaceProvider = StateNotifierProvider<UserNotifier, List<Place>>(
      (ref) => UserNotifier(),
);

