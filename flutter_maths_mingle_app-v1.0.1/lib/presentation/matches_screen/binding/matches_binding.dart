import '../controller/matches_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MatchesScreen.
///
/// This class ensures that the MatchesController is created when the
/// MatchesScreen is first loaded.
class MatchesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchesController());
  }
}
