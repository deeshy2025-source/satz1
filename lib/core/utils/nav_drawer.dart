import 'package:flutter/material.dart';

void navigateAfterDrawer(BuildContext context, String routeName, {Object? arguments}) {
  Navigator.pop(context); // اقفل الدروار الأول
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!context.mounted) return;
    Navigator.of(context).pushNamed(routeName, arguments: arguments);
  });
}