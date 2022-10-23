import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin AlertsSnackbarMixin {
  /// This method shows a dismissible red snackbar with the [message].
  /// When in debug mode, the [errorMessage] is used instead of the [message].
  void showErrorSnackBar({
    required String message,
    required String errorMessage,
    String title = 'Ops!',
    Duration duration = const Duration(seconds: 4),
  }) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: kDebugMode ? errorMessage : message,
        backgroundColor: Colors.red,
        duration: duration,
      ),
    );
  }

  /// This method shows a dismissible green snackbar with the [message].
  /// The [title] is optional.
  void showSuccessSnackBar({
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 4),
  }) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        backgroundColor: Colors.green,
        duration: duration,
      ),
    );
  }
}
