import 'package:adapter_code_base/src/config/routes/custom_navigator.dart';
import 'package:adapter_code_base/src/config/state_manager/manager_reactive_state.dart';
import 'package:adapter_code_base/src/enum/routes_enum.dart';
import 'package:adapter_code_base/src/view/components/manager_reactive_state_component.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class StateManagerView extends StatelessWidget {
  const StateManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    final reactiveStateNames =
        ManagerReactiveState<List<String>>(["Lucas", "John", "Michael"]);
    final reactiveStateNumber =
        ManagerReactiveState<List<int>>([1, 2, 3, 4, 5]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reactive State Test"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "State Manager Names - reactiveStateNames",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: reactiveStateNames.changeStateToLoading,
                    icon: const Icon(Icons.change_circle),
                  ),
                  IconButton(
                    onPressed: reactiveStateNames.changeStateToEmpty,
                    icon: const Icon(Icons.hourglass_empty),
                  ),
                  IconButton(
                    onPressed: () => reactiveStateNames.changeStateToError(
                        error: "An error has occurred"),
                    icon: const Icon(Icons.error),
                  ),
                  IconButton(
                    onPressed: () => reactiveStateNames.changeStateToDone(
                      newValue: List.generate(
                        5,
                        (index) => faker.person.name(),
                      ),
                    ),
                    icon: const Icon(Icons.done),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ReactiveStateComponent(
                managerStateReactive: reactiveStateNames,
                onDone: (value) => Column(
                  children: value
                      .map(
                        (e) => Text(
                          e,
                          style: const TextStyle(color: Colors.black),
                        ),
                      )
                      .toList(),
                ),
                onEmpty: () => const Text("No data "),
                onLoading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                onError: (error) => Text(error),
              ),
              const SizedBox(
                height: 50,
              ),
              const Divider(
                thickness: 5,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "State Manager Numbers - reactiveStateNumber",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: reactiveStateNumber.changeStateToLoading,
                    icon: const Icon(Icons.change_circle),
                  ),
                  IconButton(
                    onPressed: reactiveStateNumber.changeStateToEmpty,
                    icon: const Icon(Icons.hourglass_empty),
                  ),
                  IconButton(
                    onPressed: () => reactiveStateNumber.changeStateToError(
                        error: "An error has occurred"),
                    icon: const Icon(Icons.error),
                  ),
                  IconButton(
                    onPressed: () => reactiveStateNumber.updateState(
                      newValue: List.generate(
                        5,
                        (index) => faker.randomGenerator.integer(1000),
                      ),
                    ),
                    icon: const Icon(Icons.done),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ReactiveStateComponent(
                managerStateReactive: reactiveStateNumber,
                onDone: (value) => Column(
                  children: value
                      .map(
                        (e) => Text(
                          value.toString(),
                        ),
                      )
                      .toList(),
                ),
                onEmpty: () => const Text("No data"),
                onLoading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                onError: (error) => Text(error),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            CustomNavigator().goToRouteNamed(route: Routes.reactiveView),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
