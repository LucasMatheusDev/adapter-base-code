import 'package:adapter_code_base/src/entities/contact.dart';

abstract class IHomeContactRepository {
  Future<List<Contact>> getContacts();
}
