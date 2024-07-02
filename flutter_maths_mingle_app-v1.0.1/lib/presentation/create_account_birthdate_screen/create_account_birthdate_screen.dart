import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:intl/intl.dart';

import 'package:google_fonts/google_fonts.dart';
import 'controller/create_account_birthdate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_elevated_button.dart';
import 'package:flutter_maths_mingle_app/widgets/custom_text_form_field.dart';

final time = DateTime.now();

class CreateAccountBirthdateScreen
    extends GetWidget<CreateAccountBirthdateController> {
  const CreateAccountBirthdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PrefData.getAppBar(
            onTap: () => Get.back(),
            text: 'When is your birthdate?',
            isLeadingIcon: true),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.v),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                    height: 8.v,
                    width: 327.h,
                    decoration: BoxDecoration(
                        color: appTheme.gray10002,
                        borderRadius: BorderRadius.circular(4.h)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.h),
                        child: LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor: appTheme.gray10002,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                theme.colorScheme.primary)))),
              ),
              RichText(
                  text: TextSpan(
                      text: "1/2",
                      style: GoogleFonts.aDLaMDisplay(
                        color: AppColor.primaryColor,
                        fontSize: 20,
                      )),
                  textAlign: TextAlign.left),
              SizedBox(height: 32.h),
              buildBirthdate(context),
              SizedBox(height: 48.h),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CustomElevatedButton(
                        text: "lbl_continue".tr,
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        onPressed: () {
                          // CollectionReference users =
                          //     FirebaseFirestore.instance.collection('users');
                          // MakeAPICall.saveProfile(users);
                          onTapContinue();
                        }),
                  ),
                ),
              ),
            ])));
  }

  Padding buildBirthdate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: GestureDetector(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime(2003, DateTime.april),
              firstDate: DateTime(1950),
              //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime.now());

          if (pickedDate != null) {
            print(
                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
            String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
            print(
                formattedDate); //formatted date output using intl package =>  2021-03-16

            controller.dateController.text =
                formattedDate; //set output date to TextField value.
            // MakeAPICall.setBirthday(pickedDate);
          } else {}
        },
        child: CustomTextFormField(
            enable: false,
            controller: controller.dateController,
            hintText: (time.month.toString() +
                    " / " +
                    time.day.toString() +
                    " / " +
                    time.year.toString())
                .tr),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the createAccountGenderScreen when the action is triggered.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.createAccountSelectInterestScreen,
    );
  }
}
