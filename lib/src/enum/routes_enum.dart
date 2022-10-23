enum Routes {
  home('/home'),
  stateManager("/state-manager"),
  reactiveView("/reactive-view"),
  splashScreen('/');

  const Routes(this.name);

  final String name;

  List<String> get routesNamed =>
      Routes.values.map((route) => route.name).toList();
}
