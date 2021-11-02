import 'package:flutter_bloc/flutter_bloc.dart';

class TextCubit extends Cubit<String> {
  TextCubit() : super('');

  void capatalise(word) {
    emit(word.toUpperCase());
    print(state);
  }
}
