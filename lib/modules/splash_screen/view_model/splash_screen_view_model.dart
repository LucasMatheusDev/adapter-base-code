import 'package:adapter_code_base/src/config/routes/custom_navigator.dart';
import 'package:adapter_code_base/src/enum/routes_enum.dart';

/// This class is responsible for starting some services,
///  checking if the user is
/// logged in and then forwards you to the correct page.
class SplashScreenViewModel {
  SplashScreenViewModel() {
    _loadInitConfigAndGoToPage();
  }

  Future<void> _loadInitConfigAndGoToPage() async {
    await Future.delayed(const Duration(seconds: 4));

    return CustomNavigator().offNamed(Routes.home);
  }
}
