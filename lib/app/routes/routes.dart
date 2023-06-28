import 'package:astha/app/modules/home/views/home_view.dart';
import 'package:astha/app/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
         AutoRoute(
          path: '/home',
          page: Das.page,
        ),
      ];
}
