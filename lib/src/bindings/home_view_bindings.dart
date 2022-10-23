import 'package:adapter_code_base/modules/home/model/service/home_contact_service_imp.dart';
import 'package:adapter_code_base/modules/home/view/home_controller.dart';
import 'package:adapter_code_base/modules/home/view_model/home_view_model.dart';
import 'package:adapter_code_base/src/config/inject_dependencies/dependency_manager.dart';
import 'package:adapter_code_base/src/domain/interface/home_contact_repository.dart';
import 'package:get/get.dart';

class HomeViewBindings extends Bindings {
  @override
  void dependencies() => [
        DependencyManager().lazyPut<IHomeContactRepository>(
          () => HomeContactServiceImp(),
        ),
        DependencyManager().lazyPut<HomeViewModel>(
          () => HomeViewModel(
            homeContactRepository: DependencyManager().find(),
          ),
        ),
        DependencyManager().lazyPut<HomeController>(
          () => HomeController(
            homeViewModel: DependencyManager().find<HomeViewModel>(),
          ),
        ),
      ];
}
