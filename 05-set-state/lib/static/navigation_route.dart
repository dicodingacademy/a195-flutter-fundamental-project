enum NavigationRoute {
  // todo-03-main-08: add route name for MainScreen
  mainRoute("/main"),
  detailRoute("/detail");

  const NavigationRoute(this.name);
  final String name;
}
