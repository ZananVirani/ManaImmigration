// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/app_export.dart';
// ignore: unused_import
import 'package:flutter_maths_mingle_app/presentation/create_account_select_interest_screen/controller/create_account_select_interest_controller.dart';

import '../../../theme/custom_text_style.dart';
import '../../../widgets/custom_image_view.dart';

// ignore: must_be_immutable
class InterestOpe extends StatelessWidget {
   bool opValue;
  final String valueText;

  InterestOpe({Key? key, required this.opValue, required this.valueText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [

        CustomImageView(
          imagePath:opValue? ImageConstant.checkIc:ImageConstant.unCheckIc,
          height: 20.h,
          width: 20.h,
          margin: EdgeInsets.only(right: 8.h),
        ),
        Text(valueText,style: CustomTextStyles.bodyLargeff000000,)
      ],
    );
  }
}
