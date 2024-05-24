import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';

import 'controller/privacy_policy_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';

class PrivacyPolicyScreen extends GetWidget<PrivacyPolicyController> {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrefData.getAppBar(onTap: () => Get.back(),text:'Privacy policy' ),
        body: ListView(
          padding: EdgeInsets.only(top: 24.h,left: 24.h,right: 24.h),
            children: [

              Text("msg_types_of_data_we".tr,
                  style: theme.textTheme.headlineSmall),

              Padding(
                padding:  EdgeInsets.only(top: 6.h,bottom: 24.h),
                child: Text("msg_torem_ipsum_dolor".tr,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyLargeOutfitGray700
                        .copyWith(height: 1.50)),
              ),

              Text("msg_use_of_your_personal".tr,
                  style: theme.textTheme.headlineSmall),

              Padding(
                padding:  EdgeInsets.only(top: 6.h,bottom: 24.h),
                child: Text("msg_torem_ipsum_dolor".tr,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyLargeOutfitGray700
                        .copyWith(height: 1.50)),
              ),

              Text("msg_disclosure_of_your".tr,
                  style: theme.textTheme.headlineSmall),

              Padding(
                padding:  EdgeInsets.only(top: 6.h,bottom: 24.h),
                child: Text("msg_lorem_ipsum_dolor".tr,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyLargeOutfitGray700
                        .copyWith(height: 1.50)),
              )
            ]));
  }


  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
