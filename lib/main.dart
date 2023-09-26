import 'dart:html';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

const primaryColor = Color(0xFFFF0000);
final lastDate = DateTime(2023, 6, 15); //2023-06-15

String dateFormat(DateTime date) {
  return '${date.year}-${date.month}-${date.day}';
}

void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    final Duration pastDuration = DateTime.now().difference(lastDate);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ColoredBox(
        color: primaryColor,
        child: Column(
          children: [
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: FittedBox(
                  child: Text.rich(
                    TextSpan(text: '距离你', children: [
                      // tap to open url
                      TextSpan(
                        text: '❀',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            window.open('https://www.hust.edu.cn/', 'hust');
                          },
                        // pink color
                        style: const TextStyle(color: Color(0xFFFF00FF)),
                      ),
                      TextSpan(text: '上次${dateFormat(lastDate)}发补贴已有\n'),
                      TextSpan(
                        text: '${pastDuration.inDays}天',
                        recognizer: TapGestureRecognizer(),
                        // pink color
                        style: const TextStyle(fontSize: 24),
                      ),
                    ]),
                    style: const TextStyle(color: Color(0xFFFFFFFF)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            // footer(powered by)
            const Text(
              'Supported by @贝拉',
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
