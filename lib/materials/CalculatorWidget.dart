import 'package:flutter/material.dart';

class CalculatorWidget extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorWidget> {
  String _currentOperation = "";
  var _val1;
  var _val2;
  String _operator = "";
  bool _done = false;
  double _spacing = 20;
  var _result;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  _currentOperation,
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 7,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            child: Text("Clear"),
                            onPressed: () => _clearOperation(),
                          ),
                        ),
                        SizedBox(
                          width: _spacing,
                        ),
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: (_operator != "")
                                    ? Colors.grey
                                    : Colors.blue),
                            child: Text("/"),
                            onPressed: () => _setOperator("/"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            child: Text("7"),
                            onPressed: () => _changeOperation("7"),
                          ),
                        ),
                        SizedBox(
                          width: _spacing,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            child: Text("8"),
                            onPressed: () => _changeOperation("8"),
                          ),
                        ),
                        SizedBox(
                          width: _spacing,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            child: Text("9"),
                            onPressed: () => _changeOperation("9"),
                          ),
                        ),
                        SizedBox(
                          width: _spacing,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: (_operator != "")
                                    ? Colors.grey
                                    : Colors.blue),
                            child: Text("*"),
                            onPressed: () => _setOperator("*"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            child: Text("4"),
                            onPressed: () => _changeOperation("4"),
                          ),
                        ),
                        SizedBox(
                          width: _spacing,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            child: Text("5"),
                            onPressed: () => _changeOperation("5"),
                          ),
                        ),
                        SizedBox(
                          width: _spacing,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            child: Text("6"),
                            onPressed: () => _changeOperation("6"),
                          ),
                        ),
                        SizedBox(
                          width: _spacing,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: (_operator != "")
                                    ? Colors.grey
                                    : Colors.blue),
                            child: Text("-"),
                            onPressed: () => _setOperator("-"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            child: Text("1"),
                            onPressed: () => _changeOperation("1"),
                          ),
                        ),
                        SizedBox(
                          width: _spacing,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            child: Text("2"),
                            onPressed: () => _changeOperation("2"),
                          ),
                        ),
                        SizedBox(
                          width: _spacing,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            child: Text("3"),
                            onPressed: () => _changeOperation("3"),
                          ),
                        ),
                        SizedBox(
                          width: _spacing,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: (_operator != "")
                                    ? Colors.grey
                                    : Colors.blue),
                            child: Text("+"),
                            onPressed: () => _setOperator("+"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            child: Text("0"),
                            onPressed: () => _changeOperation("0"),
                          ),
                        ),
                        SizedBox(
                          width: _spacing,
                        ),
                        Flexible(
                          flex: 7,
                          fit: FlexFit.tight,
                          child: ElevatedButton(
                            child: Text("="),
                            onPressed: () {
                              _calculate();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _changeOperation(String val) {
    setState(() {
      if (_done) {
        _clearOperation();
        _done = false;
      }
      _currentOperation += val;
      if (_operator == "") {
        _val1 = int.parse(_currentOperation);
      } else {
        _val2 = int.parse(_currentOperation.split(_operator)[1]);
      }
    });
  }

  void _setOperator(String op) {
    setState(() {
      if (_operator == "" || _done) {
        _operator = op;
        if (_done) {
          _val1 = _result;
          _currentOperation = _val1.toString();
          _done = false;
        }
        _currentOperation += op;
      }
    });
  }

  void _clearOperation() {
    setState(() {
      _currentOperation = "";
      _operator = "";
      _val1 = 0;
      _val2 = 0;
    });
  }

  void _calculate() {
    setState(() {
      if (_operator != "" && !_done) {
        _currentOperation += "=";
        switch (_operator) {
          case "+":
            _result = (_val1 + _val2);
            break;
          case "-":
            _result = (_val1 - _val2);
            break;
          case "*":
            _result = (_val1 * _val2);
            break;
          case "/":
            _result = (_val1 / _val2);
            break;
        }
        _currentOperation += _result.toString();
        _done = true;
      }
    });
  }
}
