import '../controller/match_dating_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MatchDatingScreen.
///
/// This class ensures that the MatchDatingController is created when the
/// MatchDatingScreen is first loaded.
class MatchDatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchDatingController());
  }
}
