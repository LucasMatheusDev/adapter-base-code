import 'package:adapter_code_base/src/bindings/initial_bindings.dart';
import 'package:adapter_code_base/src/config/routes/routes_config.dart';
import 'package:adapter_code_base/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   runApp(ModularApp(module: RoutesConfig(), child: const MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       // initialBinding: InitialBindings(),
//       // getPages: RoutesConfig().getPages(),

//       title: 'decouple Getx',
//       theme: AppTheme().theme,
//       // initialRoute: "/",
//       // home: ,
//       routeInformationParser: Modular.routeInformationParser,
//       routerDelegate: Modular.routerDelegate,
//     );
//   }
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      getPages: RoutesConfig().getPages(),
      title: 'decouple Getx',
      theme: AppTheme().theme,
      // initialRoute: "/",
      // home: ,
    );
  }
}
