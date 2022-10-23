import 'package:adapter_code_base/src/config/state_manager/manager_reactive_state.dart';
import 'package:adapter_code_base/src/enum/state_enum.dart';
import 'package:flutter/cupertino.dart';

class ReactiveStateComponent<T> extends StatefulWidget {
  final ManagerReactiveState<T> managerStateReactive;
  final Widget Function(T value) onDone;
  final Widget Function(String error) onError;
  final Widget Function() onLoading;
  final Widget Function() onEmpty;
  const ReactiveStateComponent({
    required this.managerStateReactive,
    required this.onDone,
    required this.onLoading,
    required this.onEmpty,
    required this.onError,
    super.key,
  });

  @override
  State<ReactiveStateComponent<T>> createState() =>
      _ReactiveStateComponentState<T>();
}

class _ReactiveStateComponentState<T> extends State<ReactiveStateComponent<T>> {
  @override
  void dispose() {
    widget.managerStateReactive.onDisposed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.managerStateReactive.reactiveStateValue.stream,
      builder: (context, value) {
        if (value.data == StateCondition.onDone) {
          return widget.onDone(widget.managerStateReactive.internalValue);
        } else if (value.data == StateCondition.onEmpty) {
          return widget.onEmpty();
        } else if (value.data == StateCondition.onError) {
          return widget.onError(widget.managerStateReactive.messageError ?? "");
        } else {
          return widget.onLoading();
        }
      },
    );
  }
}
