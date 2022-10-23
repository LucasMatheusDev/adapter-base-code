import 'package:adapter_code_base/src/entities/contact.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final Contact contact;
  final void Function() onTap;
  const ContactWidget({
    required this.contact,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 1),
      ),
      child: ListTile(
        leading: const Icon(Icons.chat),
        title: Text(contact.name),
        trailing: const Icon(Icons.keyboard_arrow_right),
        focusNode: FocusNode(),
        onTap: onTap,
      ),
    );
  }
}
