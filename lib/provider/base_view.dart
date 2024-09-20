// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:SOUFEEDBACKAPP/provider/getit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_model.dart';
import 'package:SOUFEEDBACKAPP/locator.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDisposed;
  final Widget? child;

  const BaseView({
    Key? key,
    required this.builder,
    this.onModelReady,
    this.child,
    this.onModelDisposed,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onModelDisposed != null) {
      widget.onModelDisposed!(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
