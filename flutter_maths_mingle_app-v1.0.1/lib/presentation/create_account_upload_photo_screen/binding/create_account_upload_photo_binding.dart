import '../controller/create_account_upload_photo_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CreateAccountUploadPhotoScreen.
///
/// This class ensures that the CreateAccountUploadPhotoController is created when the
/// CreateAccountUploadPhotoScreen is first loaded.
class CreateAccountUploadPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountUploadPhotoController());
  }
}
