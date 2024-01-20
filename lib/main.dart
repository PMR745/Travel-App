import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      // home: SecondScreen(),
      home: HomePage(),
      // home: AnotherScreen(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int totalPage = 4;
  late Animation animation;
  late Animation moveAnimation;
  late AnimationController animationController;

  void animationFunc() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    moveAnimation = Tween(begin: 0.0, end: 20.0).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }

  void _onScroll() {
    print('ssss');
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    animationFunc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image: 'assets/images/one.JPG',
            title: 'Vijaya Stambha',
            description:
                'The Vijaya Stambha is an imposing victory monument located within Chittor Fort in Chittorgarh, Rajasthan, India. The tower was constructed by the Hindu Rajput king Rana Kumbha of Mewar in 1448 CE to commemorate his victory over the army of Malwa led by Mahmud Khalji in the Battle of Sarangpur.',
          ),
          makePage(
            page: 2,
            image: 'assets/images/four.JPG',
            title: 'Fateh Prakash Palace',
            description:
                'Erection of this palace was during the reign of Rana Fateh Singh. It lies within the Chittorgarh Fort. The palace served as Rana’s residence. Rana Fateh Singh intended to showcase his inclination towards art and culture through this construction. Chittorgarh lies on the Golden Quadrilateral Highway system.',
          ),
          makePage(
            page: 3,
            image: 'assets/images/two.JPG',
            title: 'Maharana Pratap Samarak',
            description:
                'Statue of Maharana Pratap of Mewar, commemorating the Battle of Haldighati. He is notable for leading the Rajput resistance against the expansionist policy of the Mughal Emperor Akbar including the Battle of Haldighati and Battle of Dewair which have turned him into a folk hero.',
          ),
          makePage(
            page: 4,
            image: 'assets/images/three.JPG',
            title: 'Padmini Palace',
            description:
                'Padmini Palace was the place of residence of Rani Padmini, the rajput queen, wife of King Rawal Ratan Singh, who played a very crucial role in rajput history. Padmini Palace was the very palace from where Ala-ud-din Khilji was permitted to obtain a glimpse of rani Padmini in a mirror placed in the main hall.',
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomRight, stops: const [
            0.3,
            0.9
          ], colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.2),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    page.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '/${totalPage.toString()}',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white.withOpacity(animation.value),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: moveAnimation.value,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 3),
                          child: const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: const Icon(
                            Icons.star,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ),
                        const Text(
                          "4.0",
                          style: TextStyle(color: Colors.white70),
                        ),
                        const Text(
                          '(2300)',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          height: 1.5,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "READ MORE",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
