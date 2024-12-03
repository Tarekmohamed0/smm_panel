import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger().i('onChange -- ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Logger().i('onTransition -- ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Logger().i('onError -- ${bloc.runtimeType}, error: $error');
  }

  // @override on close
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Logger().i('onClose -- ${bloc.runtimeType}');
  }

  // on create
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Logger().i('onCreate -- ${bloc.runtimeType}');
  }
}
