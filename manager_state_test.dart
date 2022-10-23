// # ReactiveStateComponent com Provider:
// ```dart
//  @override
//   Widget build(BuildContext context) {
//     return Consumer<ManagerReactiveState<T>>(
//       builder: (context, managerStateReactive, child) {
//         if (managerStateReactive.pureStateConditionValue ==
//             StateCondition.onDone) {
//           return onDone(managerStateReactive.internalValue);
//         } else if (managerStateReactive.pureStateConditionValue ==
//             StateCondition.onEmpty) {
//           return onEmpty();
//         } else if (managerStateReactive.pureStateConditionValue ==
//             StateCondition.onError) {
//           return onError(managerStateReactive.messageError ?? "");
//         } else {
//           return onLoading();
//         }
//       },
//     );
//   }
// ```

// # ReactiveStateComponent com BLoC:
// ```dart
//  @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<StateCondition>(
//       stream: managerStateReactive.reactiveStateValue,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           if (snapshot.data == StateCondition.onDone) {
//             return onDone(managerStateReactive.internalValue);
//           } else if (snapshot.data == StateCondition.onEmpty) {
//             return onEmpty();
//           } else if (snapshot.data == StateCondition.onError) {
//             return onError(managerStateReactive.messageError ?? "");
//           } else {
//             return onLoading();
//           }
//         } else {
//           return onLoading();
//         }
//       },
//     );
//   }
// ```

// # ReactiveStateComponent com RxDart:
// ```dart
//  @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<StateCondition>(
//       stream: managerStateReactive.reactiveStateValue,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           if (snapshot.data == StateCondition.onDone) {
//             return onDone(managerStateReactive.internalValue);
//           } else if (snapshot.data == StateCondition.onEmpty) {
//             return onEmpty();
//           } else if (snapshot.data == StateCondition.onError) {
//             return onError(managerStateReactive.messageError ?? "");
//           } else {
//             return onLoading();
//           }
//         } else {
//           return onLoading();
//         }
//       },
//     );
//   }
// ```

// # ReactiveStateComponent com StreamController:
// ```dart
//  @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<StateCondition>(
//       stream: managerStateReactive.reactiveStateValue,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           if (snapshot.data == StateCondition.onDone) {
//             return onDone(managerStateReactive.internalValue);
//           } else if (snapshot.data == StateCondition.onEmpty) {
//             return onEmpty();
//           } else if (snapshot.data == StateCondition.onError) {
//             return onError(managerStateReactive.messageError ?? "");
//           } else {
//             return onLoading();
//           }
//         } else {
//           return onLoading();
//         }
//       },
//     );
//   }
// ```
