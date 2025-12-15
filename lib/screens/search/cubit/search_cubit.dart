import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/screens/search/cubit/search_state.dart';

import '../../../data/repository/wallpaper_repository.dart';

class SearchCubit extends Cubit<SearchState>
{
  WallpaperRepository wallpaperRepository;
  SearchCubit({required this.wallpaperRepository}) : super(SearchInitialState());

  void getSearchWallpaper({required String query, String color = ""})
  async{
    emit(SearchLoadingState());
    try
        {
         var mData = await wallpaperRepository.getSearchWallpapers(query, mColor: color);
         WallpaperDataModel wallpaperDataModel = WallpaperDataModel.fromJson(mData);
         emit(SearchLoadedState(listPhoto: wallpaperDataModel.photos!, totalWallpapers: wallpaperDataModel.total_results!));
        }
        catch(e)
    {
      emit(SearchErrorState(errorMsg: e.toString()));
    }
  }
}