import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/data/pref_data/pref_data.dart';
import 'package:flutter_maths_mingle_app/presentation/create_account_upload_photo_screen/models/create_account_upload_photo_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the CreateAccountUploadPhotoScreen.
///
/// This class manages the state of the CreateAccountUploadPhotoScreen, including the
/// current createAccountUploadPhotoModelObj
class CreateAccountUploadPhotoController extends GetxController {
  Rx<CreateAccountUploadPhotoModel> createAccountUploadPhotoModelObj =
      CreateAccountUploadPhotoModel().obs;

  XFile? pickedImagePath;
  XFile? pickedSecondPic;

  late SharedPreferences prefs;
  late String imagePath;

  Future<void> getImage() async {
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    PrefData.setProfilePicPath(pickedImage!.name);


      pickedImagePath = pickedImage;

    print('picked Patgbh----${pickedImage.name}');

      update();

  }

  Future<void> getSubImage() async {
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);


    pickedSecondPic = pickedImage;
    print('picked Path----${pickedImage!.path}');
      update();

  }

  void loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    imagePath = prefs.getString('imagePath') ?? '';
     update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    // getImage();
    loadPreferences();
    super.onInit();
  }



}
