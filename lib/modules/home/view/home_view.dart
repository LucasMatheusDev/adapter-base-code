import 'package:adapter_code_base/modules/home/model/dto/contact_dto.dart';
import 'package:adapter_code_base/modules/home/view/home_controller.dart';
import 'package:adapter_code_base/src/config/routes/custom_navigator.dart';
import 'package:adapter_code_base/src/enum/routes_enum.dart';
import 'package:adapter_code_base/src/utils/get_controller.dart';
import 'package:adapter_code_base/src/view/components/manager_reactive_state_component.dart';
import 'package:adapter_code_base/src/view/components/talk_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends GetController<HomeController> {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("reactive asynchronous test"),
      ),
      body: ReactiveStateComponent<List<ContactDto>>(
        managerStateReactive: controller.contacts,
        onDone: (contacts) {
          return RefreshIndicator(
            onRefresh: controller.loadContacts,
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return ContactWidget(
                  contact: contacts[index],
                  onTap: () {},
                );
              },
            ),
          );
        },
        onLoading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error) => Center(
          child: Text(error),
        ),
        onEmpty: () => const Center(
          child: Text('No Contacts Found'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            CustomNavigator().goToRouteNamed(route: Routes.stateManager),
        label: const Text("Next Page"),
      ),
    );
  }
}

class DecorationForm extends StatelessWidget {
  const DecorationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: const InputDecoration(label: Text("LABEL")));
  }
}
