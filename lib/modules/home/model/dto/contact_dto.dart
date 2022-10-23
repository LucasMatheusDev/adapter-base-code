import 'package:adapter_code_base/src/entities/contact.dart';
import 'package:faker/faker.dart';

class ContactDto extends Contact {
  ContactDto({
    required String id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  static ContactDto fake() {
    return ContactDto(
      id: faker.randomGenerator.string(25),
      name: faker.person.firstName(),
    );
  }

  static ContactDto from(Map<String, String> json) {
    return ContactDto(
      id: json["id"] as String,
      name: json["name"] as String,
    );
  }

  static Map<String, String> to(ContactDto object) {
    return {
      "name": object.name,
      "id": object.id,
    };
  }
}
