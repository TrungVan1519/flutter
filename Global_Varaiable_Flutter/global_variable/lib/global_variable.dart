class GlobalVariable {
  String value = 'Global';

  static GlobalVariable _globalVariable = new GlobalVariable();

  static GlobalVariable get globalVariable => _globalVariable;

  _GlobalVariable() {}
}
