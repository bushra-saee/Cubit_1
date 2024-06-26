/*abstract class TextState{}
final class InitialTextState extends TextState{}
final class AddNewInputState extends TextState{}*/









abstract class TextState {
  final List<String> inputs;
  const TextState(this.inputs); 
}

class InitialTextState extends TextState {
  const InitialTextState(List<String> inputs) : super(inputs);
}

class AddNewInputState extends TextState {
  const AddNewInputState(List<String> inputs) : super(inputs);
}

class RemoveInputState extends TextState {
  const RemoveInputState(List<String> inputs) : super(inputs);
}
