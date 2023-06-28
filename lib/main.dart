import 'package:astha/app/locator/locator.dart';
import 'package:astha/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/routes/routes.dart';

void main() {
  final _appRouter = AppRouter();

  setup();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MaterialApp(home: DashBoardView())));
}
