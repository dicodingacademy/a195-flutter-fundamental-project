// todo-03: create a static value for navigation
enum NavigationRoute {
  homeRoute("/home"),
  detailRoute("/detail");

  const NavigationRoute(this.name);
  final String name;
}
