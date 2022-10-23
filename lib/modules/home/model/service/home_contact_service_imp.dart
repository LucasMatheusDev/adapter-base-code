import 'package:adapter_code_base/modules/home/model/dto/contact_dto.dart';
import 'package:adapter_code_base/src/domain/interface/home_contact_repository.dart';

class HomeContactServiceImp implements IHomeContactRepository {
  @override
  Future<List<ContactDto>> getContacts() async {
    // Delay for Test of Loading State
    await Future.delayed(const Duration(seconds: 3));

    return List.generate(100, (index) => ContactDto.fake());
  }
}
