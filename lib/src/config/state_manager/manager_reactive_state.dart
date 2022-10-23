import 'dart:async';

import 'package:adapter_code_base/src/config/state_manager/reactive.dart';
import 'package:adapter_code_base/src/enum/state_enum.dart';

class ManagerReactiveState<T> {
  final reactiveState = Reactive(StateCondition.onLoading);

  /// Get the current state of type [StateCondition]
  StateCondition get pureStateConditionValue => reactiveState.pureReactiveValue;

  /// Reactive value that represents the current state of the application.
  StreamController<StateCondition> get reactiveStateValue =>
      reactiveState.reactiveValue;

  final StreamController<T> _internalValue;

  /// Internal value of the state of type [T]
  T get internalValue => _lastValue;

  T _lastValue;

  /// Change the internal value of type [T]
  set internalValue(T newValue) {
    _lastValue = newValue;
    _internalValue.sink.add(newValue);
  }

  String? messageError;

  ManagerReactiveState(T initValue)
      : _lastValue = initValue,
        _internalValue = StreamController<T>.broadcast()..sink.add(initValue);

  /// Function called when state changes
  void _onUpdate() {}

  void onDisposed() {
    _internalValue.close();
  }

  /// where the widget state will change to onLoading.
  void changeStateToLoading() {
    reactiveState.updateValue = StateCondition.onLoading;
    _onUpdate();
  }

  /// where the widget state will be changed to onDone
  /// and receives a parameter of type T [newValue], which is the
  /// value that will be assigned to the onDone state.
  void changeStateToDone({required T newValue}) {
    _lastValue = newValue;
    _internalValue.sink.add(newValue);
    reactiveState.updateValue = StateCondition.onDone;
    _onUpdate();
  }
  



  /// Where the widget state will be changed to onEmpty
  void changeStateToEmpty() {
    reactiveState.updateValue = StateCondition.onEmpty;
    _onUpdate();
  }

  /// where the widget state will be changed to onError and
  /// will receive a String parameter, which will be the error message.
  void changeStateToError({required String error}) {
    messageError = error;
    reactiveState.updateValue = StateCondition.onError;
    _onUpdate();
  }

  /// notify the widget with same value.
  void updateState({required T newValue}) {
    _lastValue = newValue;
    _internalValue.sink.add(newValue);
    reactiveState.updateValue = StateCondition.onLoading;
    reactiveState.updateValue = StateCondition.onDone;
    _onUpdate();
  }
}
