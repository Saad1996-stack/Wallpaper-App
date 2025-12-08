import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/app_widgets/wallpaper_bg_widget.dart';
import 'package:wallpaper_app/constant/app_constants.dart';
import 'package:wallpaper_app/utils/utils_helper.dart';

class HomePage extends StatelessWidget
{
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: AppColors.primaryLightColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        ///1
        children: [
          SizedBox(
              height: 40,
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                suffixIcon: Icon(Icons.search_sharp, color: Colors.grey.shade400,),
                fillColor: AppColors.secondaryLightColor,
                hintText: "Find Wallpaper..",
                hintStyle: mTextStyle12(mColor: Colors.grey.shade400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  )
                )
              ),
            ),
          ),

          SizedBox(
            height: 11,
          ),

          ///2
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Best of Month', style: mTextStyle16(mFontWeight: FontWeight.bold),),
          ),

          SizedBox(
            height: 7,
          ),

          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AppConstants.mCategories.length,
                itemBuilder: (_,index)
                    {
                      return Padding(
                        padding: EdgeInsets.only(left: 11, right: index == AppConstants.mCategories.length -1 ? 11 : 0),
                        child: WallpaperBgWidget(imgUrl: AppConstants.mCategories[index]['image']),
                      );
                    }
            ),
          ),

          SizedBox(
            height: 16,
          ),

          ///3

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Color Tone', style: mTextStyle16(mFontWeight: FontWeight.bold),),
          ),

          SizedBox(
            height: 7,
          ),

          SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: AppConstants.mColors.length,
                itemBuilder: (_,index)
                {
                  return Padding(
                    padding: EdgeInsets.only(left: 11, right: index == AppConstants.mColors.length -1 ? 11 : 0),
                    child: getColorToneWidget(AppConstants.mColors[index])
                  );
                }
            ),
          ),

          SizedBox(
            height: 16,
          ),

          ///4

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Categories', style: mTextStyle16(mFontWeight: FontWeight.bold),),
          ),

          SizedBox(
            height: 7,
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 11,
                  childAspectRatio: 9/4,
                ),
                itemCount: AppConstants.mCategories.length,
                itemBuilder: (_,index)
                {
                  return getCategoryWidget(AppConstants.mCategories[index]['image'], AppConstants.mCategories[index]['title']);
                }
            ),
          ),

        ],
      ),
    );
  }

  Widget getColorToneWidget(Color mColor){
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: mColor,
        borderRadius: BorderRadius.circular(11),
      ),
    );
  }

  Widget getCategoryWidget(String imgUrl, String title)
  {
    return Container(
      width: 200,
      height: 100,
      child: Center(
        child: Text(title, style: mTextStyle14(mColor: Colors.white),),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.fill,
        )
      ),
    );
  }
}