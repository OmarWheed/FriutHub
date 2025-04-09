import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_debug_print_color.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    PrintMessage(
      '${bloc.runtimeType} onCreate',
    ).g;
  }

  @override
  void onClose(BlocBase bloc) {
    PrintMessage(
      '${bloc.runtimeType} onClose',
    ).g;
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    PrintMessage(
      '${bloc.runtimeType} onChange $change',
    ).y;
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    PrintMessage(
      '${bloc.runtimeType} onError $error ',
    ).r;
  }
}
