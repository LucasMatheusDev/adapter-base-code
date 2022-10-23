import 'package:adapter_code_base/modules/home/model/dto/contact_dto.dart';
import 'package:adapter_code_base/modules/home/view_model/home_view_model.dart';
import 'package:adapter_code_base/src/config/state_manager/manager_reactive_state.dart';

class HomeController {
  final HomeViewModel _homeViewModel;

  final ManagerReactiveState<List<ContactDto>> contacts =
      ManagerReactiveState([]);

  HomeController({required HomeViewModel homeViewModel})
      : _homeViewModel = homeViewModel {
    loadContacts();
  }

  Future<void> loadContacts() async {
    // init Loading State in View
    contacts.changeStateToLoading();
    final result = await _homeViewModel.getContacts();

    if (result != null) {
      contacts.internalValue = result;

      // Manager State in View
      contacts.internalValue.isEmpty
          ? contacts.changeStateToEmpty()
          : contacts.changeStateToDone(
              newValue: contacts.internalValue,
            );
    } else {
      contacts.changeStateToError(error: "");
    }
  }
}
