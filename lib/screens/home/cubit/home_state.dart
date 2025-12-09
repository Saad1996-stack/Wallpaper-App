import 'package:flutter/cupertino.dart';

import '../../../models/wallpaper_model.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}
class HomeLoadingState extends HomeState {}
class HomeLoadedState extends HomeState {
  List<PhotoModel> listPhotos;
  HomeLoadedState({required this.listPhotos});
}
class HomeErrorState extends HomeState {
  String errorMsg;
  HomeErrorState({required this.errorMsg});
}