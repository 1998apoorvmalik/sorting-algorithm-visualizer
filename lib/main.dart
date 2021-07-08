import 'package:sorting_algorithms_visualizer/algorithm_cubit/algorithm_cubit.dart';
import 'package:sorting_algorithms_visualizer/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter/material.dart";

void main() => runApp(MaterialApp(
    theme: ThemeData.light().copyWith(
      primaryColor: Colors.amber,
      buttonColor: Colors.amber,
    ),
    debugShowCheckedModeBanner: false,
    home: Scaffold(body: SortingAlgorithmsVisualizerApp())));

class SortingAlgorithmsVisualizerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlgorithmCubit(),
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) =>
                    Visualizer(
                  parentConstraints: constraints,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) =>
                    Controller(
                  parentConstraints: constraints,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
