// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_maths_mingle_app/data/list_data/app_listdata.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'controller/home_search_partners_controller.dart';
import 'models/home_search_partners_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class HomeSearchPartnersPage extends StatelessWidget {
  HomeSearchPartnersPage({Key? key}) : super(key: key);

  HomeSearchPartnersController controller =
      Get.put(HomeSearchPartnersController(HomeSearchPartnersModel().obs));

  @override
  Widget build(BuildContext context) {
    return _buildFiftyColumn();
  }

  /// Section Widget
  Widget _buildFiftyColumn() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PrimaryColors().mainColor,
        body: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: ListView(
            padding: EdgeInsets.only(top: 70.h, right: 24.h, left: 24.h),
            shrinkWrap: true,
            children: [
              Container(
                height: 550.v,
                padding: EdgeInsets.only(
                    bottom: 24.h, top: 16.h, left: 16.h, right: 16.h),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x11000000),
                      blurRadius: 16.h,
                      offset: Offset(0, 5),
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                  color: PrimaryColors().secondaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.travis,
                          height: 299.h,
                        ),
                        Container(
                          height: 299.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Color(0x0),
                                  Color(0x8A000000)
                                ]),
                            borderRadius: BorderRadiusStyle.roundedBorder8,
                          ),
                        ),
                        // Positioned(
                        //   right: 8.h,
                        //   top: 8.h,
                        //   child: CircularPercentIndicator(
                        //     radius: 25.h,
                        //     lineWidth: 5.h,
                        //     percent: 0.5,
                        //     circularStrokeCap: CircularStrokeCap.round,
                        //     progressColor: AppColor.primaryColor,
                        //     animation: true,
                        //     backgroundColor: AppColor.white,
                        //     center: Text(
                        //       '92%',
                        //       style: theme.textTheme.labelLarge,
                        //     ),
                        //   ),
                        // ),
                        // Positioned(
                        //     bottom: 8.h,
                        //     left: 5.h,
                        //     child: Text(
                        //       'Liked by 10k+ Others',
                        //       style: CustomTextStyles.bodyLargeWhiteA700,
                        //     )),
                        // Center(
                        //   child: SizedBox(
                        //     height: 280.h,
                        //     width: 280.h,
                        //     child: CardSwiper(
                        //       backCardOffset: Offset(0, 0),
                        //       cardBuilder: (context,
                        //           index,
                        //           horizontalOffsetPercentage,
                        //           verticalOffsetPercentage) {
                        //         print('index---->$index');
                        //         return Stack(
                        //           clipBehavior: Clip.none,
                        //           children: [
                        //             Container(
                        //               height: 250.h,
                        //               width: double.infinity,
                        //               decoration: BoxDecoration(
                        //                 gradient: LinearGradient(
                        //                     begin: Alignment.topCenter,
                        //                     end: Alignment.bottomCenter,
                        //                     colors: [
                        //                       Colors.transparent,
                        //                       Color(0x0),
                        //                       Color(0x8A000000)
                        //                     ]),
                        //                 borderRadius:
                        //                     BorderRadiusStyle.roundedBorder8,
                        //               ),
                        //             ),
                        // Positioned(
                        //   right: 8.h,
                        //   top: 8.h,
                        //   child: CircularPercentIndicator(
                        //     radius: 22.h,
                        //     lineWidth: 3.5.h,
                        //     percent: 0.5,
                        //     circularStrokeCap: CircularStrokeCap.round,
                        //     progressColor: AppColor.primaryColor,
                        //     animation: true,
                        //     backgroundColor: AppColor.white,
                        //     center: Text(
                        //       '50%',
                        //       style: theme.textTheme.labelLarge,
                        //     ),
                        // ),
                        // ),
                        //     Positioned(
                        //         bottom: 8.h,
                        //         left: 5.h,
                        //         child: Text(
                        //           ' ',
                        //           style:
                        //               CustomTextStyles.bodyLargeWhiteA700,
                        //         )),
                        //     index / 2 == 0
                        //         ? Center(
                        //             child: CustomImageView(
                        //               imagePath: ImageConstant.tester,
                        //               height: 56.h,
                        //             ),
                        //           )
                        //         : Center(
                        //             child: CustomImageView(
                        //               imagePath: ImageConstant.tester,
                        //               height: 56.h,
                        //             ),
                        //           )
                        //   ],
                        // );
                        //},
                        //           cardsCount: AppListData.searchPersonList.length,
                        //           controller: controller.swiperController,
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(height: 20),
                        //   ],
                        // ),
                      ],
                    ),
                    Text(
                      'FEIN',
                      style: theme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600, color: AppColor.black),
                    ),
                    Text(
                      'Travis Scott - UTOPIA',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      'Popularity (0-100): ',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.swiperController.swipe(
                                CardSwiperDirection.left,
                              );
                              controller.update();
                            },
                            child: Container(
                              width: 56.h,
                              height: 56.h,
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x11000000),
                                      blurRadius: 16,
                                      spreadRadius: 0,
                                    )
                                  ]),
                              child: Icon(
                                Icons.close_rounded,
                                size: 24.h,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: GestureDetector(
                              onTap: () {
                                controller.swiperController.swipe(
                                  CardSwiperDirection.left,
                                );
                                controller.update();
                              },
                              child: Container(
                                width: 56.h,
                                height: 56.h,
                                decoration: BoxDecoration(
                                    color: PrimaryColors().blueGray500,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x11000000),
                                        blurRadius: 16,
                                        spreadRadius: 0,
                                      )
                                    ]),
                                child: Icon(
                                  Icons.pause,
                                  size: 24.h,
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.symmetric(horizontal: 24.h),
                          //   width: 56.h,
                          //   height: 56.h,
                          //   decoration: BoxDecoration(
                          //       color: AppColor.primaryColor,
                          //       shape: BoxShape.circle,
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: Color(0x11000000),
                          //           blurRadius: 16,
                          //           spreadRadius: 0,
                          //         )
                          //       ]),
                          //   child: CustomImageView(
                          //     imagePath: ImageConstant.starWhiteIc,
                          //     margin: EdgeInsets.all(16.h),
                          //   ),
                          // ),
                          GestureDetector(
                            onTap: () {
                              controller.swiperController
                                  .swipe(CardSwiperDirection.right);

                              controller.update();
                            },
                            child: Container(
                              width: 56.h,
                              height: 56.h,
                              decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x11000000),
                                      blurRadius: 16,
                                      spreadRadius: 0,
                                    )
                                  ]),
                              child: CustomImageView(
                                imagePath: ImageConstant.loveM,
                                margin: EdgeInsets.all(16.h),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the homeSearchPartnersSwipeLeftTabContainerScreen when the action is triggered.
  onTapBtnClose() {
    Get.toNamed(
      AppRoutes.homeSearchPartnersSwipeLeftTabContainerScreen,
    );
  }
}


// delete later, keep for now just in case and apply the swipe logic to the new swipe screen
                                // CustomImageView(
                                //  imagePath:
                                      // AppListData.searchPersonList[index].img,
                                 //  height: 250.h,
                                  // width: double.infinity,
                                 //  radius: BorderRadius.circular(8.h),
                               // ),