import 'package:go_router/go_router.dart';
import 'package:hawdaj/features/home/home.dart';
import 'package:hawdaj/routing/routes_keys.dart';
import 'package:hawdaj/routing/runtime_variables.dart';

List<RouteBase> appRoutes = [
  //kFilterView
  GoRoute(
    parentNavigatorKey: navigatorKey,
    path: RoutesKeys.kWelcome,
    builder: (context, state) {
      return Home();
    },
  ),
];