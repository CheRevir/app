import 'package:app/pages/home.dart';
import 'package:app/pages/my.dart';
import 'package:app/pages/register.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  List _list = [HomePage(), MyPage()];
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: _list[0].title),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: _list[1].title)
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
      body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              this._index = index;
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return _list[index];
          }),
    );
  }
}
