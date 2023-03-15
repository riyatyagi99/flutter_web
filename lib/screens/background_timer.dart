import 'dart:html';

class BackgroundTimer {
  Worker? _worker;
  int _counter = 0;
  Function(int) _onTick;

  BackgroundTimer(this._onTick) {
    _worker = Worker('worker.js');
    _worker?.onMessage.listen((message) {
      if (message.data == 'tick') {
        _counter++;
        _onTick(_counter);
      }
    });
  }

  void start() {
    _worker?.postMessage('start');
  }

  void stop() {
    _worker?.postMessage('stop');
  }
}


