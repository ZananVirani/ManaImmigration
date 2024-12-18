import 'package:Melofy/core/app_export.dart';
import 'package:Melofy/data/apiClient/api_client.dart';

/**
 * Intial Bindings for the app.
 */
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
