import 'package:flutter/material.dart';
import 'package:nativelocation/model/place.dart';
import 'package:riverpod/riverpod.dart';
import 'dart:io';


class UserNotifier extends StateNotifier<List<Place>> {
  UserNotifier() : super(const []);

  void addPlace(File image,String title,) {
    final newPlace = Place(image,title: title);
    state = [newPlace, ...state];
  }
}

final UserPlaceProvider = StateNotifierProvider<UserNotifier, List<Place>>(
      (ref) => UserNotifier(),
);

