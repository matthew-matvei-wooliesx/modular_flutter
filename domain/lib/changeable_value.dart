class ChangeableValue {
  final String id;
  int _value;

  ChangeableValue(this.id, int value) : _value = value;

  int get value => _value;

  void increment() {
    _value++;
  }
}
