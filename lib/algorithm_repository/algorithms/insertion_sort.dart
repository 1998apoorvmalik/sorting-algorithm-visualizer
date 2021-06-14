import 'package:sorting_algorithms_visualizer/algorithm_repository/base_algorithm.dart';
import 'package:sorting_algorithms_visualizer/algorithm_cubit/algorithm_cubit.dart';
import 'package:meta/meta.dart';

class InsertionSort extends BaseAlgorithm {
  InsertionSort({@required AlgorithmCubit cubit}) : super(cubit: cubit);

  @override
  Future<void> start() async {
    for (int i = 0; i < this.cubit.state.integers.length - 1; i++) {
      for (int j = i + 1; j < this.cubit.state.integers.length; j++) {
        this.cubit.emitComparisonState(comparisonIndices: [i, j]);
        await Future.delayed(this.cubit.state.executionDelay);

        if (this.cubit.state.integers[i] > this.cubit.state.integers[j]) {
          this.swapArrayElements(i: i, j: j);
        }

        if (await this.stateListener()) {
          this.cubit.update();
        } else {
          return;
        }
      }
    }
    super.start();
  }
}
