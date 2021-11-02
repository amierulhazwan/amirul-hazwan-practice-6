import 'package:flutter_bloc/flutter_bloc.dart';

class InputCubit extends Cubit<String> {
  InputCubit() : super('');

  void capatalise(word) {
    emit(word.toUpperCase());
    print(state);
  }
}
