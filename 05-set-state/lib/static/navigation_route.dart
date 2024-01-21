enum NavigationRoute {
  // todo-main-08: add route name for MainScreen
  mainRoute("main"),
  homeRoute("home"),
  detailRoute("detail");

  const NavigationRoute(this.name);
  final String name;
}
