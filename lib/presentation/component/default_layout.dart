import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_care/common/const/color.dart';

class DefaultLayout<B extends StateStreamableSource<S>, S>
    extends StatelessWidget {
  final B Function(BuildContext context) create;
  final Widget Function(BuildContext context, B bloc, S state) builder;
  final AppBar? appBar;
  final Color? backgroundColor;
  final Widget? bottomSheet;

  const DefaultLayout({
    required this.create,
    required this.builder,
    this.appBar,
    this.backgroundColor,
    this.bottomSheet,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: create,
      child: BlocBuilder<B, S>(
        builder: (context, state) {
          final bloc = context.read<B>();
          return Scaffold(
            appBar: appBar,
            backgroundColor: backgroundColor,
            body: builder(context, bloc, state),
            bottomSheet: bottomSheet,
          );
        },
      ),
    );
  }
}
