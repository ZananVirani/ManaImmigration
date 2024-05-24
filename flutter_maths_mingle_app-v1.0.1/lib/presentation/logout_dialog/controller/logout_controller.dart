import 'package:flutter_maths_mingle_app/core/app_export.dart';
import 'package:flutter_maths_mingle_app/presentation/logout_dialog/models/logout_model.dart';

/// A controller class for the LogoutDialog.
///
/// This class manages the state of the LogoutDialog, including the
/// current logoutModelObj
class LogoutController extends GetxController {
  Rx<LogoutModel> logoutModelObj = LogoutModel().obs;
}
