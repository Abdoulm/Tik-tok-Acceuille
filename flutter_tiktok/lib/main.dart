import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter TikTok',
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoard(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          const BottomNavigationBarItem(
            icon: Icon(MdiIcons.compassOutline),
            label: 'Découvrir',
          ),
           BottomNavigationBarItem(
            icon: Image.asset('assets/images/add.png', height: 40,),
            label: '',
          ),
           BottomNavigationBarItem(
            icon: Image.asset('assets/images/comment.png', height: 20,),
            label: 'Boite de reception',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png', height: 20,),
            label: 'Moi',
          ),
        ],
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF141518),
        selectedItemColor: Colors.white,//changer la couleur de l'icone selectionnner en blanc
        unselectedItemColor: Colors.grey,//mettre la couleur des icones en gris
        onTap: _onItemTapped,
      ),
    );
  }
}


class DashBoard extends StatelessWidget {
   DashBoard({Key? key}) : super(key: key);

  final List<Map> tiktokVideos =[
    {
      "video": "assets/videos/video1.mp4",
    },
     {
      "video": "assets/videos/video2.mp4",
    },
     {
      "video": "assets/videos/video3.mp4",
    },
     {
      "video": "assets/videos/video4.mp4",
    },
     {
      "video": "assets/videos/video5.mp4",
    },
     {
      "video": "assets/videos/video6.mp4",
    },
    
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
  options: CarouselOptions(
    scrollDirection: Axis.vertical,
    viewportFraction: 1.0,
    height: double.infinity,
    ),
  items: tiktokVideos.map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          color: const Color(0xFF141518),
          child: Stack(
            children:  [
              Videos(videoUrl: i['video']),
              const PostButton()
              ],
          ),
        );
      },
    );
  }).toList(),
);
}
}


class Videos extends StatefulWidget {
  const Videos({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  _VideosState createState() =>
     // ignore: no_logic_in_create_state
     _VideosState(videoUrl) ;
    
  }

class _VideosState extends State<Videos> {
  late VideoPlayerController _controller;
  final String videoUrl;
  _VideosState(this.videoUrl);
  
  //cette permet d'executer du code au lancement de l'application
  @override
  void initState(){
    super.initState();
     _controller = VideoPlayerController.asset(videoUrl)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        _controller.setPlaybackSpeed(1.0);
        setState(() {});
      });

  } 
  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}

class PostButton extends StatelessWidget {
  const PostButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 100, 
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const [
            Icon(
                     Icons.live_tv,
                     color: Colors.white,
                     size: 30,
                   ),
            SizedBox(width: 55,),
            Text(
              'Abonnements',
               style: TextStyle(
                 color: Colors.white54, 
                 fontWeight: FontWeight.w600,
                 ),
               ),
               SizedBox(
                 width: 20,
                 ),
               Text(
              'Pour Moi',
               style: TextStyle(
                 color: Colors.white, 
                 fontWeight: FontWeight.w600,
                 ),
               ),
               SizedBox(width: 55,),
               Icon(
                     Icons.search,
                     color: Colors.white,
                     size: 30,
                   ),
               
              ],
          ),
        //color: Colors.blue
        ),
      Expanded(child: Row(
        children: [
          Expanded(child: Container(
            //color: Colors.red,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
              '@konelamine1122@gmail.com',
               style: TextStyle(
                 color: Colors.white, 
                 fontWeight: FontWeight.w600,
                 ),
               ),
               const SizedBox(height: 10),
               const Text(
              'Apprendre flutter et reproduire TIKTOK Orange Digital Kalanso',
               style: TextStyle(
                 color: Colors.white, 
                 fontWeight: FontWeight.w600,
                 ),
               ),
               const SizedBox(height: 10),
              // ignore: unnecessary_const
                Row(
                 children: const [
                   Icon(
                     Icons.music_note,
                     color: Colors.white,
                     size: 15,
                   ),
                   SizedBox(width: 5),
                   Text(
                     '2bto King - VELY 2',
                     style: TextStyle(color: Colors.white,),
                   ),
                 ],
                 ),
              ],
              ),
          ),
          ),
          Container(
            width: 80, 
            padding: const EdgeInsets.only(bottom: 10),
            //color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 80,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children:  [
                       Container(
                         margin: const EdgeInsets.only(bottom: 10),
                         child: const
                        CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/profil.jpg'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                      )
                    ],
                    ),
                  //color: Colors.blue,
                  ),
                  SizedBox(
                  height: 80,
                  child: Column(
                    children: [
                      Icon(
                        Icons.favorite, 
                        color: Colors.white.withOpacity(0.85),
                        size: 45,
                        ),
                        const Text(
                          '100K',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
                  //color: Colors.white,
                  ),
                  SizedBox(
                  height: 80,
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/ccc.png'
                        ),
                        height: 33,
                      ),
                        const Text(
                          '300',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ],
                        ),
                  //color: Colors.red,
                  ),
                  SizedBox(
                  height: 80,
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/partage.png'
                        ),
                        height: 33,
                      ),
                        const Text(
                          '100K',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ],
                        ),
                  //color: Colors.yellow,
                  ),
                  SizedBox(
                  height: 80,
                  child: Column(
                    children: [
                      Icon(
                        MdiIcons.facebook,
                        color: Colors.blue.withOpacity(0.85),
                        size: 50,
                        ),
                        ],
                        ),
                  //color: Colors.yellow,
                  ),
                 const AnimationLogo(),
              ],
              ),
            ),
        ],),
      ),
    ],
    );
  }
}

class AnimationLogo extends StatefulWidget {
 const AnimationLogo({Key? key}) : super(key: key);

  @override
  _AnimationLogoState createState() => _AnimationLogoState();
}

class _AnimationLogoState extends State<AnimationLogo> 
  with SingleTickerProviderStateMixin {
    late AnimationController _controller;

    @override
    void initState(){
      _controller = AnimationController(
        duration: const Duration(milliseconds: 4000),
        vsync: this,
      );
      _controller.repeat();
      super.initState();
    }

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return AnimatedBuilder(
        animation: _controller,
        builder: (_, child){
          return Transform.rotate(
            angle: _controller.value * 2 * math.pi,
            child: child,
            );
        },
        child: Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: const DecorationImage(
              image: AssetImage("assets/images/disk.png"),
              ),
          ),
          child: Image.asset('assets/images/img.png'),
        ),
      );
  }
}