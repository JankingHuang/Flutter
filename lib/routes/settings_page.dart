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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text('The Color follow theme'),
              ],
            ),
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text('fixation color of balck'),
                ],
              ),
            ),
            GestureDetector(
              child: const Text('GestureDetetor'),
              onTap: () => debugPrint('clicked'),
              onLongPress: () => debugPrint('Long Press'),
              onDoubleTap: () => debugPrint('Double Tap'),
            ),
            Listener(
              child: const Text('Text'),
              onPointerDown: (event) => debugPrint('onPointerDown'),
              onPointerUp: (event) => debugPrint('onPointerUp'),
              onPointerMove: (event) => debugPrint('onPointerMove'),
              onPointerCancel: (event) => debugPrint('onPointerCancel'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.palette),
          onPressed: () {
            setState(() {
              _themeColor =
                  _themeColor == Colors.teal ? Colors.blue : Colors.teal;
            });
          },
        ),
      ),
    );
  }
}
