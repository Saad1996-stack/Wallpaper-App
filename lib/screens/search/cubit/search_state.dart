import 'package:flutter/material.dart';

import '../../../models/wallpaper_model.dart';

@immutable
abstract class SearchState {}

class SearchInitialState extends SearchState {}
class SearchLoadingState extends SearchState {}
class SearchLoadedState extends SearchState {
  List<PhotoModel> listPhoto;
  num totalWallpapers;
  SearchLoadedState({required this.listPhoto, required this.totalWallpapers});
}
class SearchErrorState extends SearchState
{
  String errorMsg;
  SearchErrorState({required this.errorMsg});
}