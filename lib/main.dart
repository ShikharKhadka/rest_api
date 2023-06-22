import 'package:astha/app/locator/locator.dart';
import 'package:astha/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MaterialApp(home: DashboardView())));
}
