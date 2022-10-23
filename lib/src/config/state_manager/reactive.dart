import 'dart:async';

/// O Reactive é uma classe que tem como objetivo gerenciar
/// o estado da aplicação, o seu valor em [T]

class Reactive<T> {
  /// Este [_value] é o valor base para a reatividade, então sempre considere usar
  /// algo reativo aqui.
  /// O valor de [T] será o valor puro da variável ou seja o real valor,
  /// como por exemplo : [Reactive<List<String>>], [Reactive<String>] e etc..
  /// Para trocar o tipo de Reatividade substitua somente O tipo que envolve o [_value]
  /// exemplo :
  /// ```dart
  ///   final Rx<T> _value;
  /// ```
  ///  **Or**
  ///  ```dart
  ///   final ValueNotifier<T> _value;
  /// ```
  ///  **Note**
  /// ao alterar o tipo de também considere alterar o construtor
  /// exemplo :
  /// ```dart
  ///    Reactive(T initValue, {this.tag}) : _value = Rx(initValue);
  /// ```
  ///  **Or**
  ///  ```dart
  ///   Reactive(T initValue, {this.tag}) : _value = ValueNotifier(initValue);
  /// ```
  final StreamController<T> _value;

  /// Tag para identificação do seu objeto
  final String? tag;

  Reactive(T initValue, {this.tag})
      : _value = StreamController<T>.broadcast()..sink.add(initValue);

  /// Getter do valor com o modelo de reatividade
  StreamController<T> get reactiveValue => _value;

  late T _lastValue;

  /// Valor puro da variável, sendo correspondente
  /// ao valor de [T] informado na criação da mesma
  T get pureReactiveValue => _lastValue;

  /// Chamada quando o valor é alterado, isto serve para Packages específicos,
  /// que precisam emitir algum alerta quando são modificados.
  /// Um exemplo é o MobX, ao usa-lo recomendamos usar o [@action]
  /// como marcação desta função
  /// veja :
  /// ```dart
  /// @action
  /// void _onUpdate() {
  ///  _value = _value;
  /// }
  /// ```

  void _onUpdate() {}

  void onDisposed() {
    _value.close();
  }

  /// Função responsável por atualizar o valor da variável com um novo valor

  set updateValue(T newValue) {
    _lastValue = newValue;
    _value.sink.add(newValue);
    _onUpdate();
  }

  /// Função que atualiza os ouvintes porém com o mesmo valor atual.
  void update() {
    _value.sink.add(_lastValue);
    _onUpdate();
  }
}
