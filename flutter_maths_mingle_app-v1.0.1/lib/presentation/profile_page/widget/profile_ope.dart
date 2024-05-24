import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';


class ProfileOpe extends StatelessWidget {
  final  Function() onTap;
  final String? optionName;
  final String? opIcon;
  final bool? isLeftIcon;
  ProfileOpe({Key? key, required this.onTap, this.optionName, this.opIcon, this.isLeftIcon = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.only(right: 16.h,left: 8.h,top: 8.h,bottom: 8.h),
            decoration: AppDecoration.outlineErrorContainer
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x11000000),
                    blurRadius: 12.h,
                    spreadRadius: 0,
                  )
                ]
            ),
            child: Row(children: [
              isLeftIcon!? Container(
                  margin: EdgeInsets.only(right: 12.h),
                  height: 48.h,
                  width: 48.h,
                  padding: EdgeInsets.all(12.h),
                  decoration: AppDecoration.fillGray100.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder24),
                  child: CustomImageView(
                      imagePath:opIcon?? ImageConstant.accountIc,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      alignment: Alignment.center)):SizedBox(),
              Expanded(
                child: Text(optionName??"lbl_my_account".tr,
                    style: theme.textTheme.bodyLarge),
              ),

              CustomImageView(
                imagePath: ImageConstant.arrowRightIc,
                height: 20.h,
              )
            ])));
  }
}
