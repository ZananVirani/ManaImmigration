import 'package:flutter/material.dart';
import 'package:flutter_maths_mingle_app/core/utils/size_utils.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';
import '../../../widgets/custom_image_view.dart';

class SelectGenderContainer extends StatelessWidget {
  final String? gender;
  final String? genImg;
  final bool isSelected;
  const SelectGenderContainer(
      {Key? key, this.gender, this.genImg, required this.isSelected})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: isSelected
                    ? AppColor.primaryLightColor
                    : AppColor.lightGray,
                borderRadius: BorderRadius.circular(8.h),
                border: Border.all(
                  color:
                      isSelected ? AppColor.primaryColor : Colors.transparent,
                  width: 1.h,
                )),
            child: CustomImageView(
              imagePath: genImg,
              height: 98.h,
              width: 45.h,
              color: isSelected ? AppColor.primaryColor : AppColor.black30,
              alignment: Alignment.center,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Text(
            gender!,
            style: CustomTextStyles.bodyLargeff000000,
          ),
        )
      ],
    );
  }
}
