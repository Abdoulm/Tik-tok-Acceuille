import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiki/Elements/video_post.dart';
import 'package:preload_page_view/preload_page_view.dart';

class Printing extends StatefulWidget {
  const Printing({Key? key}) : super(key: key);

  @override
  _PrintingState createState() => _PrintingState();
}

class _PrintingState extends State<Printing> {
  var liste = ["video_1.mp4", "1.MP4"];
  late PreloadPageController _pageController;

  bool isPageStable = false;
  int current = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PreloadPageController();

    _pageController.addListener(scrollListener);
  }

  void scrollListener() {
    if (isPageStable &&
        _pageController.page == _pageController.page!.roundToDouble()) {
      setState(() {
        current = _pageController.page!.toInt();
        isPageStable = false;
      });
    } else if (!isPageStable && current.toDouble() != _pageController.page) {
      if ((current.toDouble() - _pageController.page!).abs() > 0.1) {
        setState(() {
          isPageStable = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.black,
        ),
        child: BottomNavigationBar(
          iconSize: 30,
          unselectedLabelStyle:
              TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
          showSelectedLabels: true,
          currentIndex: 2,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  EvaIcons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.search,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("middle_btn.png"),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.messageSquare,
              ),
              label: "Message",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.person,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            PreloadPageView.builder(
              controller: _pageController,
              preloadPagesCount: 2,
              itemCount: liste.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (contex, index) {
                return VideoPost(
                  video_url: liste[index],
                  pageIndex: index,
                  currentPageIndex: index,
                );
              },
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("text Editor"),
                  Text("|"),
                  Text("editor"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
