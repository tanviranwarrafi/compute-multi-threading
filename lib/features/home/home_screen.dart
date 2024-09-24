import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isolate/components/buttons/elevate_button.dart';
import 'package:flutter_isolate/features/home/components/animated_box.dart';
import 'package:flutter_isolate/themes/colors.dart';
import 'package:flutter_isolate/themes/text_styles.dart';

const _DURATION = Duration(seconds: 1);

class HomeScreen extends StatefulWidget {
  @override
  _HeavyComputationPageState createState() => _HeavyComputationPageState();
}

class _HeavyComputationPageState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  var _isComputing = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  var _result = 'Press start to compute factorials';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _DURATION)..repeat(reverse: true);
    _animation = Tween<double>(begin: -140, end: 140).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Multi-Threading Example')),
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: primary.withOpacity(0.3), borderRadius: BorderRadius.circular(16)),
              child: Center(child: AnimatedBox(controller: _controller, animation: _animation)),
            ),
            const SizedBox(height: 40),
            Text('Main Thread', style: TextStyles.text18_500.copyWith(color: dark)),
            const SizedBox(height: 06),
            ElevateButton(
              width: double.infinity,
              label: 'Start Heavy Computation',
              onTap: _isComputing ? null : _computationInMainThread,
            ),
            const SizedBox(height: 20),
            Text('Background Thread', style: TextStyles.text18_500.copyWith(color: dark)),
            const SizedBox(height: 06),
            ElevateButton(
              width: double.infinity,
              label: 'Start Heavy Computation',
              onTap: _isComputing ? null : _computationInBackgroundThread,
            ),
            const SizedBox(height: 32),
            Center(child: Text(_result, textAlign: TextAlign.center, style: TextStyles.text18_500.copyWith(color: dark))),
          ],
        ),
      ),
    );
  }

  Future<void> _computationInMainThread() async {
    _isComputing = true;
    _result = 'Computing on main thread...';
    setState(() {});

    var result = computeFactorials(10000);
    _result = 'Computed factorial sum: $result';
    _isComputing = false;
    setState(() {});
  }

  Future<void> _computationInBackgroundThread() async {
    _isComputing = true;
    _result = 'Computing on background thread...';
    setState(() {});

    var result = await compute(computeFactorials, 1000);
    _result = 'Computed factorial sum: $result';
    _isComputing = false;
    setState(() {});
  }
}

int computeFactorials(int limit) {
  int sum = 0;
  for (int i = 1; i <= limit; i++) {
    sum += factorial(i);
  }
  return sum;
}

int factorial(int n) {
  if (n == 0 || n == 1) return 1;
  return n * factorial(n - 1);
}
