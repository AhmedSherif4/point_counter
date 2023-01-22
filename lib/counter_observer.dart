import 'package:bloc/bloc.dart';

// help us observe all state changes in the application.
class CounterObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('$bloc, $change');
  }
}