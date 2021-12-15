import 'package:flutter/material.dart';

class ThemeRoute extends StatefulWidget {
  const ThemeRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ThemeRoute();
  }
}

class _ThemeRoute extends State<ThemeRoute> {
  late MaterialColor _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
        //这里颜色修改智慧修改TmeeRoute中的，需要把_themeColor 传递到全局
        iconTheme: IconThemeData(color: _themeColor),
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      debugPrint('Gesture');
                      Navigator.of(context).pushNamed('Gesture');
                    },
                    child: const Text("点击、双击、长按")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('Drag');
                    },
                    child: const Text("拖动")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('Scale');
                    },
                    child: const Text("缩放")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
