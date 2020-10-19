import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:siku/blocs/loader_bloc.dart';
import 'package:siku/modules/modules.dart';

class LoaderApp extends StatelessWidget {
  final Widget child;

  const LoaderApp({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: context.watch<Loader>().isLoading,
      progressIndicator: spinkitCircle,
      child: child,
    );
  }
}
