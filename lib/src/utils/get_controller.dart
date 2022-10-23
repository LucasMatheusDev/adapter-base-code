import 'package:adapter_code_base/src/config/inject_dependencies/dependency_manager.dart';
import 'package:flutter/cupertino.dart';

abstract class GetController<T extends Object> extends StatelessWidget {
  const GetController({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => DependencyManager().find<T>(tag: tag);
}
