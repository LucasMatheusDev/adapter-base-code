# ADAPTER BASE CODE (ABC)

This lib is based on the Pattern Adapter design, to learn more about the pattern visit the link: https://refactoring.guru/design-patterns/adapter.

The idea is to go beyond the pattern and create a basis for the development of a project, with this, bringing a range of options to the developer and decouple the code and in the future have several pre-ready paths to start a project with a specific structure but decoupled.

---
## Motivation: 

The real motivation of this Manifesto, if we can call it that, was to use Package Getx, and maybe the architecture of this LIB reflects that, the idea of having a great Package created by a Brazilian and being afraid to use it because it brings a great coupling makes me very frustrated, so after a while studying about decoupling and how to make the code with a high maintainability I arrived at the technique that this Lib is based on.

---
## Considerations:  
First of all, I want you to think that the main objective of this Lib/Manifesto is to make your code so easy to replace Packages that in the end choosing between one and the other won't make much difference, because you can easily replace it, and the second objective is to create a kind of multiple **Base Code**, where we could start our project by **Getx**, **Modular** and etc..

This LIB is totally open to criticism and improvements, so if you found something that could be improved, just create your Pull Request, a new branch **FOLLOWING THE ABC TECHNIQUE** will be welcome that brings your way of starting the your project, thus bringing more options to the next programmer.

Because this idea came about through a Getx problem, maybe this architecture is familiar to those who already use Getx, but the idea is that with the increase in the visibility of this repository we will be able to receive more contributions from developers who have their own style of creating the its architecture, making this Lib/Manifesto fit all styles.

### Note 
> After applying these concepts you will have your main package imports only inside your source, so when you make any changes you will only do it in the **src** folder and your entire application will benefit.

---
## Fundamentals:
  
   ### What is a Base Code?

  A Base Code is a code that serves as the basis for your project, where you can create a new project and already have a structure of folders and files ready for you to start developing.

___
   ### ABC Technique - Adapter Base Code

  The ABC technique is a technique that aims to create an Adapter Base Code where you will make a **wrapper** of your main package, and so you can change the main package without having to change your code, because your code will communicate with your Adapter Base Code, not the main package.

  *An example is Dependency Injection that you will see next.*


# How to use:
    
      
# Injeção de dependências

Below you will see examples of implementations with different Packages.

The Class responsible for your dependency injections will be [DependencyManager](lib\src\config\inject_dependencies\dependency_manager.dart), which will be responsible for abstracting your injection method, making your project not have to worry where the instances come from.

### Note
And after you clone this repository, you can rename the classes in the way that makes the most sense for you.

---
## - Injection with Getx 
  
```dart
class DependencyManager {
  void lazyPut<S extends Object>(
    S Function() dependency, {
    String? tag,
    bool isSingleton = false,
  }) {
    Get.lazyPut<S>(
      dependency,
      fenix: isSingleton,
      tag: tag,
    );
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
```

---
## - Injection with GetIt 

```dart
class DependencyManager {
  void lazyPut<S extends Object>(
    S Function() dependency, {
    String? tag,
    bool isSingleton = false,
  }) {
    GetIt getIt = GetIt.instance;
    getIt.registerSingleton<S>(dependency(), signalsReady: true);
  }

  put<S extends Object>(
    S dependency, {
    String? tag,
    bool permanent = false,
    S Function()? builder,
  }) {
    GetIt getIt = GetIt.instance;
    getIt.registerSingleton<S>(
      dependency,
    );
  }

  S find<S extends Object>({String? tag}) {
    GetIt getIt = GetIt.instance;
    return getIt<S>();
  }
}
```


---
  ## - Injection with Modular 


  ```dart
  class DependencyManager {
    Bind<S> lazyPut<S extends Object>(
      S Function() dependency, {
      String? tag,
      bool isSingleton = false,
    }) {
      return Bind.lazySingleton<S>(
        (i) => dependency(),
      );
    }

    Bind<S> put<S extends Object>(
      S dependency, {
      String? tag,
      bool permanent = false,
      S Function()? builder,
    }) {
      return Bind<S>(
        (i) => dependency,
      );
    }

    S find<S extends Object>({String? tag}) {
      return Modular.get<S>();
    }
  }
  ```
 
  > We can see that the codes are very similar, and that your work to change the dependency manager took only 10 or 15 minutes, so the idea is to abstract the function from the package to a class responsible for that function.

---
# Navigation Configuration

Next, we will use the same ABC abstraction technique for the respective class, the class that is designated to manage route navigation will be [CustomNavigator](lib\src\config\routes\custom_navigator.dart).

   > Remember that you can rename the classes however it makes sense to you and also add more navigation functions, as this class doesn't contain all navigation methods, just the essential ones.

  
----------------

## Using Modular as a route manager:

  > Lembre-se para usar o Modular como gerenciador de rotas, você deve configurar o seu arquivo [main.dart](lib\src\main.dart) da forma que o modular solicita, está configuração será abordada posteriormente.


```dart

class CustomNavigator {

  Future<T?>? goToRouteNamed<T>({
    required Routes route,
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Modular.to.pushNamed(
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
    return Modular.to.pop(
      result,
    );
  }

  Future<T?>? offNamed<T>(
    Routes newRouteName, {
    bool Function(Route<dynamic>)? predicate,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) async =>
      await Modular.to.pushReplacementNamed(
        newRouteName.name,
        arguments: parameters,
      );

  dynamic get args => Modular.args;
}
```
 
 ---
## Using Getx as a route manager: 
```dart
class CustomNavigator {
    
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

  Future<T?>? offNamed<T>({
    required Routes newRouteName,
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

``` 

### ***Note***: 
The parameter [Routes](lib\src\enum\routes_enum.dart) is just an enum with the names of the routes, see:

 ```dart
enum Routes {
  home('/home'),
  login("/login"),
  splashScreen('/');

  const Routes(this.name);

  final String name;

  List<String> get routesNamed =>
      Routes.values.map((route) => route.name).toList();
}
```
  > And again it only takes 10 to 15 minutes to change our route navigation management.

--- 
# State management
  Undoubtedly one of the best points in using this pattern is the ease of managing the state of the application, our class [Reactive](lib\src\config\state_manager\reactive.dart) will be responsible for bringing the reactivity logic and will be the base for our widget [ReactiveComponent](lib\src\view\components\reactive_component.dart).
  
  > The ReactiveComponent is a widget that will be responsible for listening to the changes in the state of the application, and will be responsible for rebuilding the widget tree when the state changes.

  ## Understanding Reactive:
  Reactive will be the abstraction of your package of choice for state management,
  making your reactivity can be replaced in a simple and fast way, so you won't need to change the code of your entire application, but only in your ***src** folder.
  
  The Reactive class contains the methods that will be responsible for managing the state of the application, and also the methods that will be responsible for listening for state changes, and finally, the methods that will be responsible for notifying the state changes.

  The variable type [_value](lib\src\config\state_manager\reactive.dart#L31) is a generic defined by whoever instantiates the class.
  
  ### Example
  
   ``` dart
    Reactive<String> reactive = Reactive<String>("text");
  ```
    
  > Reactive is a generic class, and the generic type is defined at the moment of instantiation of the class, in the example above, the generic type is String, so Reactive will be responsible for managing the state of a String.
___

### Overriding state management:
   
   Management override in most cases is very easy, [involve generic type](lib\src\config\state_manager\reactive.dart#L31 ) and [assigned value in constructor](lib\src\config\state_manager\ reactive.dart#L36) from Reactive with the type of your state management package.
    
  #### example:
  ```dart
  // With Getx
      class Reactive<T> {
      final Rx<T> _value;
      // ...

        Reactive(T initValue, {this.tag}) : _value = Rx(initValue);

   ```

   > In the example above, Reactive is involved with the Rx of Getx, so Reactive will be responsible for managing the state of an Rx.

  ```dart
      // With ValueNotifier
      class Reactive<T> {
      final ValueNotifier<T> _value;
      // ...

        Reactive(T initValue, {this.tag}) : _value = ValueNotifier(initValue);

   ```
  > In the example above, Reactive is involved with Flutter's ValueNotifier, so Reactive will be responsible for managing the state of a ValueNotifier.

---

  ### Note:
   > When changing Reactive, you change the way its state will be managed, and consequently change the way your widget will be reactivated, so it will be necessary to change the [ReactiveComponent](lib\src\view\components\reactive_component.dart) , [ReactiveStateComponent](lib\src\view\components\reactive_component.dart) and [ManagerReactiveState](lib\src\config\state_manager\manager_reactive_state.dart) as well, how to change these components will be explained later.
___

## Using ValueNotifier as state management:

```dart
 class Reactive<T> {
 
  final ValueNotifier<T> _value;

  final String? tag;

  Reactive(T initValue, {this.tag}) : _value = ValueNotifier(initValue);

  ValueNotifier<T> get reactiveValue => _value;

  T get pureReactiveValue => _value.value;


  void _onUpdate() {}

  set updateValue(T newValue) {
    _value.value = newValue;
    _onUpdate();
  }

  void update() {
    _value.value = _value.value;
    _onUpdate();
  }
}

```

## Using Getx as State Management:
```dart

import 'package:get/get.dart';

  class Reactive<T> {

    final Rx<T> _value;
  
    final String? tag;
  
    Reactive(T initValue, {this.tag}) : _value = Rx(initValue);
  
    Rx<T> get reactiveValue => _value;
  
    T get pureReactiveValue => _value.value;
  
    void _onUpdate() {}
  
    set updateValue(T newValue) {
      _value.value = newValue;
      _onUpdate();
    }

    void update() {
      _value.value = _value.value;
      _onUpdate();
    }
  }
  
  ```

  # Using Mobx as State Management:

  #### Note: 
  > To use Mobx as a state manager, it is necessary that the project has the mobx as a dependency, and that the mobx_codegen is configured in pubspec.yaml, for more information on how to configure the mobx_codegen, access the link: [Mobx](https://pub.dev/packages/mobx_codegen)


  ```dart
import 'package:mobx/mobx.dart';
part 'reactive.g.dart';

class Reactive<T> = _Reactive with _$Reactive;

abstract class _Reactive<T> with Store {
 
// Remember to remove the [final] from the variable [_value]
   // so the mobx can manage the state

  @observable
  T _value;

  final String? tag;

  _Reactive(T initValue, {this.tag}) : _value = initValue;

  T get reactiveValue => _value;

  T get pureReactiveValue => _value;


  @action
  void _onUpdate() {
    _value = _value;
  }

  set updateValue(T newValue) {
    _value = newValue;
    _onUpdate();
  }

  @action
  void update() {
    _value = _value;
    _onUpdate();
  }
}

```
 # Using Stream as State Management:

 ```dart
 final StreamController<T> _value;

 
  final String? tag;

  Reactive(T initValue, {this.tag})
      : _value = StreamController<T>.broadcast()..sink.add(initValue);

  StreamController<T> get reactiveValue => _value;

  late T _lastValue;

  T get pureReactiveValue => _lastValue;

  void _onUpdate() {}

  void onDisposed() {
    _value.close();
  }

  set updateValue(T newValue) {
    _lastValue = newValue;
    _value.sink.add(newValue);
    _onUpdate();
  }

  void update() {
    _value.sink.add(_lastValue);
    _onUpdate();
  }
  ```
   
  Note : 
   > The **_lastValue** Variable is responsible for storing the last value that was assigned to **_internalValue** , because **_internalValue** is a [StreamController] and there is no way to get the last value that was assigned to it. This will only be necessary if you need this value without accessing a Stream , in code that is asynchronous because your state managers will not need this value, therefore creating this attribute is **optional**.


  _______________________________________________________________
  # Understanding ManagerReactiveState:
    
  [ManagerReactiveState](lib\src\config\state_manager\manager_reactive_state.dart) is the class responsible for managing the state of a widget where it has the possibility of having more than one state, such as the state of **onLoading** , **onError**, **onEmpty** and **onDone**, being very similar to Flutter's BLOC, but with the possibility of being used with any state manager, such as Getx, Mobx and ValueNotifier.

  This is usually used in places that look for information like [Future] or [Stream], and that need a loading, error, empty and success state.

  [ManagerReactiveState](lib\src\config\state_manager\manager_reactive_state.dart)* was created to be used with [ReactiveStateComponent](lib\src\view\components\reactive_component.dart), which is a widget that already expects a **managerStateReactive** as a parameter, and that already has the necessary parameters to manage the widget's state.
  
  These states are based on the enum [StateCondition](lib\src\enum\state_enum.dart)
  Look :


  ```dart
  enum StateCondition {
    onLoading,
    onError,
    onEmpty,
    onDone,
  }
  ```

  ## Methods:

 - ***changeStateToLoading***, where the widget state will change to onLoading.

  - ***changeStateToError***, where the widget state will be changed to onError and will receive a String parameter, which will be the error message.

  - ***changeStateToEmpty***, where the widget state will be changed to onEmpty.

  - ***changeStateToDone***, where the widget state will be changed to onDone and receives a parameter of type T, which is the value that will be assigned to the onDone state.


   ### Note: 
   > The same modifications made to [ReactiveStateComponent] should also be made to [ReactiveComponent](lib\src\view\components\reactive_component.dart)) as both depend on the reactivity type chosen.
___


  # ManagerReactiveState with Mobx:
  ```dart
  
  import 'package:mobx/mobx.dart';

class ManagerReactiveState<T> {
  final reactiveState = Reactive(StateCondition.onLoading);

  StateCondition get pureStateConditionValue => reactiveState.pureReactiveValue;

  Observable<StateCondition> get reactiveStateValue =>
      reactiveState.reactiveValue;

  final Observable<T> _internalValue;

  T get internalValue => _internalValue.value;

  set internalValue(T newValue) {
    _internalValue.value = newValue;
  }

  String? messageError;

  ManagerReactiveState(T initValue) : _internalValue = Observable(initValue);

// The rest of the code remains the same...

  ``` 
 
  # ManagerReactiveState with ValueNotifier:
  ```dart
  import 'package:flutter/material.dart';

class ManagerReactiveState<T> {
  final reactiveState = Reactive(StateCondition.onLoading);

  StateCondition get pureStateConditionValue => reactiveState.pureReactiveValue;

  ValueNotifier<StateCondition> get reactiveStateValue =>
      reactiveState.reactiveValue;

  final ValueNotifier<T> _internalValue;

  T get internalValue => _internalValue.value;

  set internalValue(T newValue) {
    _internalValue.value = newValue;
  }

  String? messageError;


  ManagerReactiveState(T initValue) : _internalValue = ValueNotifier(initValue);

  // The rest of the code remains the same...

  ```

  # ManagerReactiveState with Getx:
  ```dart
  import 'package:get/get.dart';
 final reactiveState = Reactive(StateCondition.onLoading);

  StateCondition get pureStateConditionValue => reactiveState.pureReactiveValue;

  Rx<StateCondition> get reactiveStateValue => reactiveState.reactiveValue;

  final Rx<T> _internalValue;

  T get internalValue => _internalValue.value;

  set internalValue(T newValue) {
    _internalValue.value = newValue;
  }

  String? messageError;

  ManagerReactiveState(T initValue) : _internalValue = Rx(initValue);

// The rest of the code remains the same...

  ```

  Note: 
   > So far we have learned to change the state management of the classes responsible for **Logic** , the widgets that listen for the changes and rebuild the screen must follow these changes and we will see that now.

  # Using ManagerReactiveState with Stream:
  ```dart
  import 'package:flutter/material.dart';
  import 'package:reactive_state/src/config/state_manager/manager_reactive_state.dart';
  import 'package:reactive_state/src/view/components/reactive_component.dart';

  import 'package:get/get.dart';
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

        
  void onDisposed() {
    _internalValue.close();
  }

  void changeStateToDone({required T newValue}) {
    _lastValue = newValue;
    _internalValue.sink.add(newValue);
    reactiveState.updateValue = StateCondition.onDone;
    _onUpdate();
  }

  void updateState({required T newValue}) {
    _lastValue = newValue;
    _internalValue.sink.add(newValue);
    reactiveState.updateValue = StateCondition.onLoading;
    reactiveState.updateValue = StateCondition.onDone;
    _onUpdate();
  }

  ... // The rest of the code remains the same...

  ```      
  Note : 
   > The **_lastValue** Variable is responsible for storing the last value that was assigned to **_internalValue** , because **_internalValue** is a [StreamController] and there is no way to get the last value that was assigned to it. This will only be necessary if you need this value without accessing a Stream , in code that is asynchronous because your state managers will not need this value, therefore creating this attribute is **optional**.

___
#  ReactiveStateComponent o que é ? 
It is the widget responsible for listening to changes and rebuilding the screen, its differential is having the possibility of having more than one state, such as the state of **onLoading** , **onError** , **onEmpty** and * *onDone** , all configurable.
  
The [ReactiveStateComponent](lib\src\view\components\reactive_component.dart) is a widget that already expects a **managerStateReactive** as a parameter, and that already has the necessary parameters to manage the widget's state.

Note: 
  > The state management choices of the components must be the same as for the Logic classes of each widget, as the component will listen for changes and reconstruct the screen. So if you use Mobx in Logic classes, you should use Mobx in components too.



# ReactiveStateComponent com GetX:
```dart
 @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (managerStateReactive.pureStateConditionValue ==
            StateCondition.onDone) {
          return onDone(managerStateReactive.internalValue);
        } else if (managerStateReactive.pureStateConditionValue ==
            StateCondition.onEmpty) {
          return onEmpty();
        } else if (managerStateReactive.pureStateConditionValue ==
            StateCondition.onError) {
          return onError(managerStateReactive.messageError ?? "");
        } else {
          return onLoading();
        }
      },
    );
  }
```

# ReactiveStateComponent com ValueNotifier:
```dart
 @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: managerStateReactive.reactiveStateValue,
      builder: (context, StateCondition stateCondition, child) {
        if (stateCondition == StateCondition.onDone) {
          return onDone(managerStateReactive.internalValue);
        } else if (stateCondition == StateCondition.onEmpty) {
          return onEmpty();
        } else if (stateCondition == StateCondition.onError) {
          return onError(managerStateReactive.messageError ?? "");
        } else {
          return onLoading();
        }
      },
    );
  }
```

# ReactiveStateComponent com Mobx:
```dart
 @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (managerStateReactive.pureStateConditionValue ==
            StateCondition.onDone) {
          return onDone(managerStateReactive.internalValue);
        } else if (managerStateReactive.pureStateConditionValue ==
            StateCondition.onEmpty) {
          return onEmpty();
        } else if (managerStateReactive.pureStateConditionValue ==
            StateCondition.onError) {
          return onError(managerStateReactive.messageError ?? "");
        } else {
          return onLoading();
        }
      },
    );
  }
```

# ReactiveStateComponent com Stream:
 ```dart
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

 ```
  Note: 
 > When using [ReactiveStateComponent](lib\src\view\components\reactive_component.dart) with Streams, it is necessary to dispose of StreamControllers, as StreamBuilder does not do this automatically. a possible solution is to add the controller's dispose in the **onDispose** function of the [ManagerReactiveState] class and make its [ReactiveStateComponent] as StateFull so that it can call the dispose in the State's **dispose** function.
 

