///can be mixed with any stateful widget to hold state of a button
class ButtonClickState {
  bool _isClickable = true;
  void _disableClicking() => _isClickable = false;
  void _enableClicking() => _isClickable = true;
  bool get isClickable => _isClickable;
  void processAndWait(Function() func) async {
    if (!isClickable) return;
    _disableClicking();
    try {
      await func();
    } catch (e) {}
    _enableClicking();
  }
}
