import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout_app/widgets/app_large_text.dart';

class School extends StatefulWidget {
  const School({Key? key}) : super(key: key);

  @override
  _SchoolState createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  List images = [
    "bg1.jpg",
    "bg2.jpg",
    "bg3.jpg",
    "bg4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "images/" + images[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 85, left: 30, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppLargeText(text: "叮当猫"),
                        // ResponsiveButton(width: 100),
                      ],
                    ),
                    Column(
                      children: List.generate(4, (indexDots) {
                        return Container(
                          width: 8,
                          margin: const EdgeInsets.only(bottom: 2),
                          height: index == indexDots ? 25 : 8,
                          //index 为ViewPager 所在也的索引，
                          //indexDots 为List 的索引，
                          //如果相等，就表示list 中index 为当前viewPager 页
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:
                                index == indexDots ? Colors.amber : Colors.blue,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
