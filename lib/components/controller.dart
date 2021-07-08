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
  int _selectedAlgorithmIndex = 0;

  @override
  void initState() {
    AlgorithmType.values.forEach((element) {
      String value = element.toString().split('.')[1];
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
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<AlgorithmCubit, AlgorithmState>(
        builder: (context, state) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: screenWidth / 25, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time Elapsed: 0.000s",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Row(
                  children: [
                    ElevatedButton(
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
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          state.status == AlgorithmExecutionStatus.executing
                              ? "Pause"
                              : "Sort",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () => context.read<AlgorithmCubit>().reset(),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "Reset",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            CupertinoSlidingSegmentedControl(
                groupValue: this._selectedAlgorithmIndex,
                children: _algorithmsSelectionNames.asMap(),
                thumbColor: Colors.blueGrey,
                onValueChanged: (newIndex) {
                  this.setState(() {
                    this._selectedAlgorithmIndex = newIndex;
                    context.read<AlgorithmCubit>().changeAlgorithmTyoe(
                        newAlgorithmType: AlgorithmType.values[newIndex]);
                  });
                }),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sorting Speed',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Slider(
                        value: _currentExecutionSpeedSliderValue ??
                            (MAX_EXEC_DELAY -
                                DEFAULT_EXEC_DELAY +
                                MIN_EXEC_DELAY),
                        min: MIN_EXEC_DELAY.toDouble(),
                        max: MAX_EXEC_DELAY.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            _currentExecutionSpeedSliderValue = value;
                          });

                          int microseconds =
                              (MAX_EXEC_DELAY - value + MIN_EXEC_DELAY).toInt();

                          Duration newDuration =
                              Duration(microseconds: microseconds);

                          context.read<AlgorithmCubit>().changeExecutionSpeed(
                                executionSpeed: newDuration,
                              );
                        },
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        'Number of Bars',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Slider(
                        value: _currentBarNumberSliderValue ?? DEFAULT_BARS,
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
            ),
          ],
        ),
      );
    });
  }
}
