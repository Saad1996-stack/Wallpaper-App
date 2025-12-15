import 'package:wallpaper_app/data/remote/api_helper.dart';
import 'package:wallpaper_app/data/remote/urls.dart';

class WallpaperRepository {
  ApiHelper apiHelper;
  WallpaperRepository({required this.apiHelper});

  ///search wallpaper
  Future<dynamic>getSearchWallpapers(String mQuery, {String mColor = ""}) async{
    try {
      return await apiHelper.getAPI(url: "${AppUrls.SEARCH_WALL_URL}?query=$mQuery&color=$mColor");
    }
    catch (e) {
      throw(e);
    }
  }

  ///trending wallpaper
  Future<dynamic>getTrendingWallPapers() async{
    try {
      return await apiHelper.getAPI(url: AppUrls.TRENDING_WALL_URL);
    }
    catch(e){
      throw(e);
    }
  }
}