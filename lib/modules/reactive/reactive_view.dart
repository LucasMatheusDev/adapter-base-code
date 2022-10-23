import 'package:adapter_code_base/src/config/state_manager/reactive.dart';
import 'package:adapter_code_base/src/view/components/reactive_component.dart';
import 'package:flutter/material.dart';

class ReactiveView extends StatelessWidget {
  const ReactiveView({super.key});

  @override
  Widget build(BuildContext context) {
    final reactiveText = Reactive("Hello World");
    final textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive View'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReactiveComponent(
            reactive: reactiveText,
            builder: (value) => Text(value),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: textController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Reactive Text',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    reactiveText.updateValue = textController.text;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
