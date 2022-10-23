import 'package:get/get.dart';

class DependencyManager {
  S lazyPut<S extends Object>(
    S Function() dependency, {
    String? tag,
    bool isSingleton = false,
  }) {
    Get.lazyPut<S>(
      dependency,
      fenix: isSingleton,
      tag: tag,
    );
    return dependency();
  }

  S put<S extends Object>(
    S dependency, {
    String? tag,
    bool permanent = false,
    S Function()? builder,
  }) {
    return Get.put<S>(
      dependency,
    );
  }

  S find<S extends Object>({String? tag}) {
    return Get.find<S>();
  }
}

// class DependencyManager {
//   void lazyPut<S extends Object>(
//     S Function() dependency, {
//     String? tag,
//     bool isSingleton = false,
//   }) {
//     GetIt getIt = GetIt.instance;
//     getIt.registerSingleton<S>(dependency(), signalsReady: true);
//   }

//   put<S extends Object>(
//     S dependency, {
//     String? tag,
//     bool permanent = false,
//     S Function()? builder,
//   }) {
//     GetIt getIt = GetIt.instance;
//     getIt.registerSingleton<S>(
//       dependency,
//     );
//   }

//   S find<S extends Object>({String? tag}) {
//     GetIt getIt = GetIt.instance;
//     return getIt<S>();
//   }
// }
