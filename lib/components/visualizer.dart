import 'package:sorting_algorithms_visualizer/algorithm_cubit/algorithm_cubit.dart';
import 'package:sorting_algorithms_visualizer/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Visualizer extends StatefulWidget {
  final List<Container> integerDisplayArray = [];
  final BoxConstraints parentConstraints;

  Visualizer({
    @required this.parentConstraints,
  });

  @override
  _VisualizerState createState() => _VisualizerState();
}

class _VisualizerState extends State<Visualizer> {
  void update({@required AlgorithmState state}) {
    this.widget.integerDisplayArray.clear();

    List<Color> tileColors = [
      Colors.blueGrey,
      Colors.purpleAccent,
      Colors.pinkAccent,
    ];

    int i = 0;
    state.integers.forEach(
      (element) {
        double elementWidth =
            this.widget.parentConstraints.maxWidth / state.integers.length;
        double elementHeight = (element / state.integers.length) *
            this.widget.parentConstraints.maxHeight;

        this.widget.integerDisplayArray.add(
              Container(
                color: Colors.amberAccent,
                height: elementHeight,
                width: elementWidth,
              ),
            );

        if (state.status == AlgorithmExecutionStatus.completed) {
          state.comparisonIndices.forEach((value) {
            if (value == i) {
              this.widget.integerDisplayArray.last = Container(
                  height: elementHeight,
                  width: elementWidth,
                  color: Colors.greenAccent);
            }
          });
        } else {
          state.comparisonIndices.forEach((value) {
            if (value == i) {
              this.widget.integerDisplayArray.last = Container(
                  height: elementHeight,
                  width: elementWidth,
                  color: tileColors.removeLast());
            }
          });
        }
        i++;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlgorithmCubit, AlgorithmState>(
        builder: (context, state) {
      this.update(state: state);
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: this.widget.integerDisplayArray,
      );
    });
  }
}
