# MultiThread

To use compute method
 ``` xml
    var result = await compute(computeFactorials, 1000);
 ```

To use isolate method
 ``` xml
    var result = await _runIsolate(1000);
 ```

Isolate runner function
 ``` xml
  Future<int> _runIsolate(int limit) async {
    final receivePort = ReceivePort();
    await Isolate.spawn(_isolateEntry, [receivePort.sendPort, limit]);
    return await receivePort.first;
  }
 ```

Entry function for Isolate
 ``` xml
  void _isolateEntry(List<dynamic> args) {
    final sendPort = args[0] as SendPort;
    final limit = args[1] as int;
    final result = computeFactorials(limit);
    sendPort.send(result);
  }
 ```
### The isolate runs the computeFactorials function in the background and sends the result back to the main thread, which is then displayed in the UI.

Heavy task Method
 ``` xml
  int computeFactorials(int limit) {
    int sum = 0;
    for (int i = 1; i <= limit; i++) {
    sum += factorial(i);
    }
  return sum;
  }
 ```