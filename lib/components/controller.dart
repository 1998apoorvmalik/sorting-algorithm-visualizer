import 'package:sorting_algorithms_visualizer/algorithm_cubit/algorithm_cubit.dart';
import 'package:sorting_algorithms_visualizer/constants.dart';
import 'package:sorting_algorithms_visualizer/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Controller extends StatefulWidget {
  final BoxConstraints parentConstraints;

  Controller({@required this.parentConstraints});

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  double _currentExecutionSpeedSliderValue;
  double _currentBarNumberSliderValue;
  List<Widget> _algorithmsSelectionNames = [];

  @override
  void initState() {
    AlgorithmType.values.forEach((element) {
      String value = element.toString().split('.')[1].split('S').join(" S");
      _algorithmsSelectionNames.add(
        Center(
          child: Text(
            value,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlgorithmCubit, AlgorithmState>(
        builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    'Selected Algorithm: ',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Flexible(
                  child: CupertinoPicker(
                    itemExtent: this.widget.parentConstraints.maxHeight / 2,
                    onSelectedItemChanged: (index) => context
                        .read<AlgorithmCubit>()
                        .changeAlgorithmTyoe(
                            newAlgorithmType: AlgorithmType.values[index]),
                    scrollController: FixedExtentScrollController(
                      initialItem:
                          AlgorithmType.values.indexOf(DEFAULT_ALGORITHM_TYPE),
                    ),
                    children: this._algorithmsSelectionNames,
                    looping: true,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: FloatingActionButton(
              onPressed: () {
                switch (state.status) {
                  case AlgorithmExecutionStatus.initial:
                    context.read<AlgorithmCubit>().start();
                    break;
                  case AlgorithmExecutionStatus.executing:
                    context.read<AlgorithmCubit>().pause();
                    break;
                  case AlgorithmExecutionStatus.paused:
                    context.read<AlgorithmCubit>().resume();
                    break;
                  case AlgorithmExecutionStatus.completed:
                    break;
                }
              },
              child: Icon(state.status == AlgorithmExecutionStatus.executing
                  ? Icons.pause
                  : Icons.play_arrow),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Execution Speed',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Min",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text('Max', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Slider(
                  value: _currentExecutionSpeedSliderValue ??
                      (MAX_EXEC_DELAY - DEFAULT_EXEC_DELAY + MIN_EXEC_DELAY),
                  label: "Execution Speed",
                  min: MIN_EXEC_DELAY.toDouble(),
                  max: MAX_EXEC_DELAY.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _currentExecutionSpeedSliderValue = value;
                    });

                    int microseconds =
                        (MAX_EXEC_DELAY - value + MIN_EXEC_DELAY).toInt();

                    Duration newDuration = Duration(microseconds: microseconds);

                    context.read<AlgorithmCubit>().changeExecutionSpeed(
                          executionSpeed: newDuration,
                        );
                  },
                ),
              ],
            ),
          ),
          Flexible(
            child: FloatingActionButton(
              child: Text("Reset"),
              onPressed: () => context.read<AlgorithmCubit>().reset(),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No. of Bars',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Min",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text('Max', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Slider(
                  value: _currentBarNumberSliderValue ?? DEFAULT_BARS,
                  label: "No. of Bars",
                  min: MIN_BARS.toDouble(),
                  max: MAX_BARS.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      this._currentBarNumberSliderValue = value;
                    });

                    context
                        .read<AlgorithmCubit>()
                        .changeNumberOfBars(numberOfbars: value.toInt());
                  },
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
