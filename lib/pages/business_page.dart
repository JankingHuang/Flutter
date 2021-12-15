import 'package:flutter/material.dart';

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Business();
  }
}

class _Business extends State<Business> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('广场上走着，一排穿透明衣的人；我能看见他们的心跳，却无法见证他们的位移。'),
            color: Colors.teal[100],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('无人之境，笑语含混不清；天地倒置，伞是满天的云。'),
            color: Colors.teal[200],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('人们为了拒绝这份灌溉，个个向天空举起了盾牌。'),
            color: Colors.teal[300],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('朦胧的城市下，地面满是倒影的碎片。'),
            color: Colors.teal[400],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('万物开始吵闹，人间却安静了下来。'),
            color: Colors.teal[500],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('天使也会路过人间，哪怕人间不值得，日升月落，也会有黎明。'),
            color: Colors.teal[600],
          ),
        ],
      ),
    );
  }
}
