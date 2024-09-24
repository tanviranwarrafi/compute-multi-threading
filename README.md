# flutter_compute

To use compute method
 ``` xml
    var result = await compute(computeFactorials, 1000);
 ```

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