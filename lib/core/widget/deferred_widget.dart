import 'package:flutter/material.dart';

class DeferredWidgetBuilder extends StatefulWidget {
  final WidgetBuilder widgetBuilder;

  final Future Function() loadFunction;

  const DeferredWidgetBuilder(
      {super.key, required this.widgetBuilder, required this.loadFunction});

  @override
  State<DeferredWidgetBuilder> createState() => _DeferredWidgetBuilderState();
}

class _DeferredWidgetBuilderState extends State<DeferredWidgetBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.loadFunction(),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.done) {
            return widget.widgetBuilder(context);
          } else {
            return  const SizedBox(
                height: 64,
                width: 64,
                child:  CircularProgressIndicator());
          }
        });
  }
}
