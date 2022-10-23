import 'package:adapter_code_base/src/config/state_manager/reactive.dart';
import 'package:flutter/cupertino.dart';

class ReactiveComponent<T> extends StatefulWidget {
  final Reactive<T> reactive;
  final Widget Function(T value) builder;
  const ReactiveComponent({
    required this.reactive,
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<ReactiveComponent<T>> createState() => _ReactiveComponentState<T>();
}

class _ReactiveComponentState<T> extends State<ReactiveComponent<T>> {
  @override
  void dispose() {
    widget.reactive.onDisposed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.reactive.reactiveValue.stream,
      builder: (__, value) {
        if (value.hasData) {
          return widget.builder(value.data as T);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
