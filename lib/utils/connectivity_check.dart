import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hawdaj/Widgets/connection_error_dialog.dart';

Future<void> checkConnection({
  required BuildContext ctx,
  required Function retryAction,
  required Function normalAction,
}) async {
  final connectivityResult = await Connectivity().checkConnectivity();

  // ignore: unrelated_type_equality_checks
  if (connectivityResult == ConnectivityResult.none) {
    if (!ctx.mounted)
      return; // Ensure the context is still mounted before using it
    showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (context) => NetworkErrorDialog(
        onPressed: () async {
          final newConnectivityResult =
              await Connectivity().checkConnectivity();
          // ignore: unrelated_type_equality_checks
          if (newConnectivityResult == ConnectivityResult.none) {
            Fluttertoast.showToast(msg: 'No Connection !!');
          } else {
            await retryAction();
            if (context.mounted) {
              Navigator.pop(context);
            }
            Fluttertoast.showToast(msg: 'Connection is restored.');
          }
        },
      ),
    );
  } else {
    await normalAction();
  }
}
