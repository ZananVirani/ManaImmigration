// // ignore_for_file: unnecessary_import

// import 'package:country_pickers/country.dart';
// import 'package:country_pickers/country_pickers.dart';
// import 'package:country_pickers/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_maths_mingle_app/core/app_export.dart';
// import 'package:flutter_maths_mingle_app/presentation/login_empty_state_screen/controller/login_empty_state_controller.dart';

// import '../presentation/create_account_phone_number_screen/controller/create_account_phone_number_controller.dart';

// // ignore: must_be_immutable
// class CustomPhoneNumber extends StatelessWidget {
//   CustomPhoneNumber({
//     Key? key,
//     required this.country,
//     required this.onTap,
//     required this.controller,
//   }) : super(
//           key: key,
//         );

//   Country country;

//   Function(Country) onTap;

//   TextEditingController? controller;

//   CreateAccountPhoneNumberController controllers  = Get.put(CreateAccountPhoneNumberController());
//   LoginEmptyStateController loginEmptyStateController = Get.put(LoginEmptyStateController());

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: appTheme.gray100,
//         borderRadius: BorderRadius.circular(
//           8.h,
//         ),
//       ),
//       child: Row(
//         children: [
//           InkWell(
//             onTap: () {
//               _openCountryPicker(context);


//             },
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: 16.h,
//                 top: 8.h,
//                 bottom: 8.h,
//               ),
//               child: Row(
//                 children: [
//                   CountryPickerUtils.getDefaultFlagImage(country),
//                   Padding(
//                     padding:  EdgeInsets.only(left: 8.h,right: 16.h),
//                     child: Text("+" + country.phoneCode,
//                       style:theme.textTheme.bodyLarge!.copyWith(
//                         color: AppColor.black40
//                       )
//                     ),
//                   ),
//                   Container(
//                     height: 40.h,
//                     width: 1.h,
//                     color: AppColor.black30,
//                   )

//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: 8.h,
//                 right: 5.h,
//               ),
//               child: TextFormField(
//                 controller: controller,
//                  cursorColor: Colors.black,
//                  maxLines: 1,
//                  maxLength: 10,
//                  keyboardType: TextInputType.number,
//                  // inputFormatters: [
//                  //   MaskedTextInputFormatter(mask:'123-125-1254' , separator: '-'),
//                  // ],
//                  decoration: InputDecoration(
//                  fillColor: Colors.white,
//                  counterText: "",
//                  filled: false,
//                  isDense: true,
//                  hintText: 'Enter phone number',
//                  hintStyle: CustomTextStyles.bodyLargeff696969,
//                  enabledBorder: const OutlineInputBorder(

//                  borderSide: BorderSide(
//                  color: Colors.transparent,)
//                  ,),
//                  focusedErrorBorder: const OutlineInputBorder(

//                   borderSide: BorderSide(color: Colors.transparent)),

//                  focusedBorder: const OutlineInputBorder(

//                  borderSide: BorderSide(color: Colors.transparent)),
//                  ),
//                  // validator: (value) {
//                  //   if ( value!.isEmpty ) {
//                  //     return "Please enter valid number . ".tr;
//                  //   }
//                  //   return null;
//                  // },
//                  onChanged: (value) {
//                   controllers.number = value;
//                   loginEmptyStateController.number = value;
//                   controllers.update();


//                    print('Phone Number is  --> ${value.length}');

//                  }),



//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDialogItem(Country country) => Row(
//         children: <Widget>[
//           CountryPickerUtils.getDefaultFlagImage(country),
//           Container(
//             margin: EdgeInsets.only(
//               left: 10.h,
//             ),
//             width: 60.h,
//             child: Text(
//               "+${country.phoneCode}",
//               style: TextStyle(fontSize: 14.fSize),
//             ),
//           ),
//           const SizedBox(width: 8.0),
//           Flexible(
//             child: Text(
//               country.name,
//               style: TextStyle(fontSize: 14.fSize),
//             ),
//           ),
//         ],
//       );


//   void _openCountryPicker(BuildContext context) => showDialog(
//         context: context,
//         builder: (context) => CountryPickerDialog(
//           searchInputDecoration: InputDecoration(
//             hintText: 'Search...',
//             hintStyle: TextStyle(fontSize: 14.fSize),
//           ),
//           isSearchable: true,
//           title: Text('Select your phone code',
//               style: TextStyle(fontSize: 14.fSize)),
//           onValuePicked: (Country country) => onTap(country),
//           itemBuilder: _buildDialogItem,

//         ),
//       );




// }


// class MaskedTextInputFormatter extends TextInputFormatter {
//   final String mask;
//   final String separator;
//   MaskedTextInputFormatter({
//     required this.mask,
//     required this.separator,
//   });
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.text.isNotEmpty) {
//       if (newValue.text.length > oldValue.text.length) {
//         if (newValue.text.length > mask.length) return oldValue;
//         if (newValue.text.length < mask.length &&
//             mask[newValue.text.length - 1] == separator) {
//           return TextEditingValue(
//             text:
//             '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
//             selection: TextSelection.collapsed(
//               offset: newValue.selection.end + 1,
//             ),
//           );
//         }
//       }
//     }
//     return newValue;}
// }
