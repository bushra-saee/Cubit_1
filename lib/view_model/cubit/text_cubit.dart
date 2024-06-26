import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cubit_test/view_model/cubit/text_state.dart';

class TextCubit extends Cubit<TextState> {
  TextCubit() : super(InitialTextState([]));

  static TextCubit get(context) => BlocProvider.of<TextCubit>(context);

  List<String> inputs = [];
TextEditingController inputController = TextEditingController();

//void addinput() {
  //inputs.add(inputController.text);
  //emit(AddNewInputState());}

   void addInput() {
   
      inputs.add(inputController.text);
      inputController.clear(); 
      emit(AddNewInputState((List.from(inputs)))); 
    
  }

   void removeInput(int index) {
    inputs.removeAt(index);
    emit(RemoveInputState(List.from(inputs)));
  }

}


