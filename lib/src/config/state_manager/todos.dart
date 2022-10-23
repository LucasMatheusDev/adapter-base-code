import 'package:mobx/mobx.dart';
// Include generated file

// This is the class used by rest of your codebase
class Todo = TodoBase with Store;

// The store-class
abstract class TodoBase with Store {
  TodoBase(this.description);

  @observable
  String description = '';

  @observable
  bool done = false;
}
