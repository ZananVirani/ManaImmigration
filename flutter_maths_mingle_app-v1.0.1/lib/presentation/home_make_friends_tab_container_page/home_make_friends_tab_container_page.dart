// ignore_for_file: must_be_immutable

import 'package:flutter_maths_mingle_app/data/list_data/app_listdata.dart';
import 'package:flutter_maths_mingle_app/presentation/home_search_partners_page/home_search_partners_page.dart';
import '../home_make_friends_tab_container_page/widgets/users_story_container.dart';
import 'controller/home_make_friends_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/home_make_friends_page/home_make_friends_page.dart';


class HomeMakeFriendsTabContainerPage extends StatelessWidget {
  HomeMakeFriendsTabContainerPage({Key? key})
      : super(
          key: key,
        );

  HomeMakeFriendsTabContainerController controller =
      Get.put(HomeMakeFriendsTabContainerController());



  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 127.h,
            padding: EdgeInsets.only(left: 24.h,right: 24.h,bottom: 16.h),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Welcome',style: CustomTextStyles.headlineSmallWhiteA700,),
                      Text('John Abram',style: theme.textTheme.labelLarge!.copyWith(
                        color: Color(0xFFDCDCDC),
                        fontSize: 12.fSize,
                        fontWeight: FontWeight.w400,
                      ),),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.profilePage,);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.h),
                    height: 40.h,width: 40.h, decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.whiteLight,
                  ),
                    child: CustomImageView(
                      imagePath: ImageConstant.profileIc,
                      height: 24.h,
                    ),
                  ),
                )
              ],
            )
        ),
        Container(

          height: 130.h,
          child: ListView.separated(

            padding: EdgeInsets.only(left: 24.h,top: 16.h,bottom: 24.h),

            shrinkWrap: true,
            itemCount: AppListData.usersStoryList.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 16.h,
              );
            },
            itemBuilder: (context, index) {
              return UserStoryContainer(index: index,
                  userProfileImg: AppListData.usersStoryList[index].userImage!,
                  userName: AppListData.usersStoryList[index].userName!);

            },),
        ),
        Container(
          height: 28.h,
          margin: EdgeInsets.symmetric(horizontal: 24.h),
          child: TabBar(
            controller: controller.tabviewController,

            labelPadding: EdgeInsets.zero,
            labelColor: theme.colorScheme.primary,
            labelStyle: TextStyle(
              fontSize: 15.fSize,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelColor: appTheme.gray700,
            unselectedLabelStyle: TextStyle(
              fontSize: 15.fSize,
              fontFamily: 'Satoshi',
              fontWeight: FontWeight.w400,
            ),
            indicatorColor: AppColor.primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                child: Text(
                  "lbl_make_friend".tr,
                ),
              ),
              Tab(
                child: Text(
                  "lbl_search_partners".tr,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller.tabviewController,
            children: [
              HomeMakeFriendsPage(),
              HomeSearchPartnersPage(),
            ],
          ),
        ),
      ],
    );
  }


}
