import 'package:flutter/material.dart';
import 'package:layout_app/routes/business_page.dart';
import 'package:layout_app/routes/school_page.dart';
import 'package:layout_app/routes/settings_page.dart';
import 'package:layout_app/widgets/random_words.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  int _selectedIndex = 0;
  late PageController controller;
  List<String> listTitle = [
    'Home',
    'Business',
    'School',
    'Settings',
  ];

  List<MaterialColor> listColor = [
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.pink,
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: 0,
      keepPage: true,
    );

    // controller.addListener(() {
    //   double? page = controller.page;
    //   // print('PageView Index: $page');
    // });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      controller.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listTitle.elementAt(_selectedIndex)),
        backgroundColor: listColor.elementAt(_selectedIndex),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (value) {
          // ignore: avoid_print
          print("OnPageChanged: $value");
          setState(() {
            _selectedIndex = value;
          });
        },
        children: const [
          Center(
            child: RandomWords(),
          ),
          Center(
            child: Business(),
          ),
          Center(
            child: School(),
          ),
          Center(
            child: ThemeRoute(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[500],
        onTap: _onItemTapped,
      ),
    );
  }
}
