import 'package:adapter_code_base/modules/splash_screen/view_model/splash_screen_view_model.dart';
import 'package:adapter_code_base/src/config/inject_dependencies/dependency_manager.dart';
import 'package:get/get.dart';

/// This is the initial binding for the application
/// It is responsible for initializing the dependencies
/// application initials
class InitialBindings extends Bindings {
  @override
  void dependencies() => [
        DependencyManager().put<SplashScreenViewModel>(
          SplashScreenViewModel(),
        ),
      ];
}
