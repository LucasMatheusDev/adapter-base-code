import 'package:adapter_code_base/src/enum/routes_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// This class is responsible for calling all
/// navigation methods, replacing [Navigator]
class CustomNavigator {
// Note for reviewer:
// this is a [wrapper] technique to wrap the function
// of a package that will be used a lot,
// avoiding any direct coupling,
// in case there is any shock in this package it can be
// easily replaced by another that does the same thing
  Future<T?>? goToRouteNamed<T>({
    required Routes route,
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(
      route.name,
      arguments: arguments,
    );
  }

  void back<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    return Get.back(
      result: result,
      canPop: canPop,
      closeOverlays: closeOverlays,
    );
  }

  Future<T?>? offNamed<T>(
    Routes newRouteName, {
    bool Function(Route<dynamic>)? predicate,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) async =>
      await Get.offNamed(
        newRouteName.name,
        arguments: parameters,
      );

  dynamic get args => Get.arguments;
}
