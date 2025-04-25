class Memoria {
  static const List<String> operaciones = ['%', '/', 'x', '-', '+', '='];

  final List<double> _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? _operacion;
  String _valor = '0';
  bool _wipeValor = false;

  void applyCommand(String comando) {
    print("Comando recibido: $comando"); // Para depurar
    if (comando == 'AC') {
      _limpiarTodoAC();
    } else if (operaciones.contains(comando)) {
      _setOperacion(comando);
    } else {
      _addDigito(comando);
    }
  }

  void _setOperacion(String nuevaOperacion) {
    // Si ya había una operación activa y estamos en el segundo número
    if (_operacion != null && _bufferIndex == 1) {
      _buffer[0] = _calcular();
      _valor = _buffer[0].toString();
      _valor = _valor.endsWith('.0') ? _valor.split('.')[0] : _valor;
    } else {
      // Primer número ingresado
      _buffer[0] = double.tryParse(_valor) ?? 0.0;
    }

    bool esIgual = nuevaOperacion == '=';

    _operacion = esIgual ? null : nuevaOperacion;
    _bufferIndex = esIgual ? 0 : 1;
    _wipeValor = true;

    if (esIgual) {
      _buffer[1] = 0.0;
    }
  }

  void _addDigito(String digito) {
    final esPunto = digito == '.';
    final wipeValor = (_valor == '0' && !esPunto) || _wipeValor;

    if (esPunto && _valor.contains('.') && !wipeValor) {
      return;
    }

    final valorVacio = esPunto ? '0' : '';
    final currentValor = wipeValor ? valorVacio : _valor;

    _valor = currentValor + digito;
    _wipeValor = false;

    _buffer[_bufferIndex] = double.tryParse(_valor) ?? 0.0;
  }

  double _calcular() {
    switch (_operacion) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  void _limpiarTodoAC() {
    _valor = '0';
    _buffer[0] = 0.0;
    _buffer[1] = 0.0;
    _operacion = null;
    _bufferIndex = 0;
    _wipeValor = false;
  }

  String get valor => _valor;
}
