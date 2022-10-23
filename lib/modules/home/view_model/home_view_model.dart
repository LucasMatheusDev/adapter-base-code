import 'package:adapter_code_base/modules/home/model/dto/contact_dto.dart';
import 'package:adapter_code_base/src/domain/interface/home_contact_repository.dart';

class HomeViewModel {
  final IHomeContactRepository _repository;

  HomeViewModel({required IHomeContactRepository homeContactRepository})
      : _repository = homeContactRepository;

  Future<List<ContactDto>?> getContacts() async {
    return await _repository.getContacts() as List<ContactDto>;
  }
}
