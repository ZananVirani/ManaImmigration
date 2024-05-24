// ignore_for_file: must_be_immutable

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'controller/login_empty_state_controller.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_phone_number.dart';

class LoginEmptyStateScreen extends GetWidget<LoginEmptyStateController> {
   LoginEmptyStateScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PrefData.getAppBar(onTap: () => Get.back(), text: 'Login'),
        body: GetBuilder<LoginEmptyStateController>(
          init: LoginEmptyStateController(),
          builder: (controller) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 24.h, right: 24.h, top: 16.h),
                            child: Text("msg_enter_your_phone".tr,
                                style: theme.textTheme.bodyLarge))),
                    Padding(
                      padding:
                      EdgeInsets.only(left: 24.h, right: 24.h, top: 32.h,),
                      child: CustomPhoneNumber(
                          country: controller.selectedCountry.value,
                          controller: controller.phoneNumberController,
                          onTap: (Country value) {
                            controller.selectedCountry.value = value;
                          }),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 24.h),
                      child: controller.errorShow? showError(controller):SizedBox(),
                    ),

                    // CustomElevatedButton(
                    //   margin: EdgeInsets.only(left: 24.h,right: 24.h,top: 48.h),
                    //     text: "Login".tr,
                    //     onPressed: () {
                    //       if(controller.number.length >= 10 && controller.number.isNotEmpty){
                    //         onTapContinue();
                    //         controller.errorShow=false;
                    //         controller.phoneNumberController.text = '';
                    //         controller.number = '';
                    //         controller.update();
                    //       }
                    //       else{
                    //         controller.errorShow=true;
                    //         controller.update();
                    //
                    //       }
                    //     }),

                    CustomElevatedButton(
                      margin: EdgeInsets.only(left: 24.h,right: 24.h,top: 48.h),
                        text: "Login".tr,
                        onPressed: () {
                          if(controller.number.length >= 10 && controller.number.isNotEmpty){
                            onTapContinue();
                            controller.errorShow=false;
                            controller.phoneNumberController.text = '';
                            controller.number = '';
                            controller.update();
                          }
                          else{
                            controller.errorShow=true;
                            controller.update();

                          }
                          // Get.toNamed(AppRoutes.loginOtpAuthenticationScreen);
                        }),
                    _buildFrame(),
                    _buildFrame1(),



                  ]),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: 48.h),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text("msg_don_t_have_an_account".tr,
                            style: theme.textTheme.bodyMedium)),
                    Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: GestureDetector(
                          onTap: () {
                            onTapLoginWithPhone();
                          },
                          child: Text("lbl_sign_up".tr,
                              style: CustomTextStyles.titleSmallPrimary),
                        ))
                  ]),
                )
              ],
            ),
          );
        },)
    );
  }

  /// Section Widget
   Widget showError(LoginEmptyStateController controller) => controller.number.length >=10?SizedBox(): Text('Please enter valid number ',style: CustomTextStyles.labelLargeError,);


  /// Section Widget
  Widget _buildFrame() {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 24.h,top: 32.h,bottom: 24.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 1.2.h,
                  dashLength: 3.h,
                  dashColor: AppColor.black30,

                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.white,

                  dashGapRadius: 0.0,
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.h),
                child: Text("lbl_login_with".tr, style: theme.textTheme.bodyMedium),
              ),
              Expanded(
                child: DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 1.2.h,
                  dashLength:3.h,
                  dashColor: AppColor.black30,

                  dashRadius: 0.0,
                  dashGapLength: 4.0,
                  dashGapColor: Colors.white,

                  dashGapRadius: 0.0,
                ),
              ),
            ]));
  }

  /// Section Widget
  Widget _buildGoogleButton() {
    return Expanded(
      child: CustomElevatedButton(
        onPressed:  () {
        },
          text: "lbl_google".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 8.h),
              child: CustomImageView(
                  imagePath: ImageConstant.GoogleIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          buttonStyle: CustomButtonStyles.fillGray,
          buttonTextStyle: theme.textTheme.bodyLarge!),
    );
  }

  /// Section Widget
  Widget _buildAppleButton() {
    return Expanded(
      child: CustomElevatedButton(
          text: "lbl_apple".tr,
          leftIcon: Container(
              margin: EdgeInsets.only(right: 8.h),
              child: CustomImageView(
                  imagePath: ImageConstant.iphoneIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          buttonStyle: CustomButtonStyles.fillGray,
          buttonTextStyle: theme.textTheme.bodyLarge!),
    );
  }

  /// Section Widget
  Widget _buildFrame1() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.h),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildGoogleButton(),SizedBox(width: 20.h,), _buildAppleButton()]),
    );
  }

  /// Navigates to the previous screen.
   onTapContinue() {
    Get.toNamed(AppRoutes.loginOtpAuthenticationScreen);
  }

   onTapLoginWithPhone() {
     Get.toNamed(
       AppRoutes.createAccountPhoneNumberScreen,
     );
   }
}
