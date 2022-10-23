import 'package:adapter_code_base/modules/home/view/home_view.dart';
import 'package:adapter_code_base/modules/reactive/reactive_view.dart';
import 'package:adapter_code_base/modules/splash_screen/splash_screen_view.dart';
import 'package:adapter_code_base/modules/state_manager/view/state_manager_view.dart';
import 'package:adapter_code_base/src/bindings/home_view_bindings.dart';
import 'package:adapter_code_base/src/bindings/initial_bindings.dart';
import 'package:adapter_code_base/src/enum/routes_enum.dart';
import 'package:get/get.dart';

/// This Class is responsible for configuring all pages of the application,
/// adding the corresponding bindings to the pages and setting the routes.
class RoutesConfig {
  // @override
  // List<Bind> get binds => [
  //       ...HomeViewBindings().dependencies(),
  //       ...InitialBindings().dependencies(),
  //     ];

  // @override
  // List<ModularRoute> get routes => [
  //       ModuleRoute(
  //         Routes.splashScreen.name,
  //         module: SplashModule(),
  //       ),
  //       ChildRoute(
  //         Routes.home.name,
  //         child: (context, args) => const HomeView(),
  //       ),
  //       ChildRoute(
  //         Routes.stateManager.name,
  //         child: (context, args) => const StateManagerView(),
  //       )
  //     ];

  List<GetPage> getPages() {
    return [
      GetPage(
        name: Routes.splashScreen.name,
        binding: InitialBindings(),
        page: () => const SplashScreenView(),
      ),
      GetPage(
        name: Routes.home.name,
        page: () => const HomeView(),
        binding: HomeViewBindings(),
      ),
      GetPage(
        name: Routes.stateManager.name,
        page: () => const StateManagerView(),
      ),
      GetPage(
        name: Routes.reactiveView.name,
        page: () => const ReactiveView(),
      ),
    ];
  }

  List<String> getPageNames() {
    return getPages().map((GetPage page) => page.name).toList();
  }
}

// class SplashModule extends Module {
//   @override
//   List<Bind> get binds => [
//         ...InitialBindings().dependencies(),
//       ];

//   @override
//   List<ModularRoute> get routes => [
//         ChildRoute(
//           Routes.splashScreen.name,
//           child: (context, args) => const SplashScreenView(),
//         ),
//       ];
// }
