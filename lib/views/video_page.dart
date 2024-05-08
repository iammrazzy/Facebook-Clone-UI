import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  // List item
  List<String> items = [
    'For you',
    'Live',
    'Gaming',
    'Following',
  ];

  List<IconData> icons = [
    Icons.person_4_rounded,
    Icons.live_tv,
    Icons.games_outlined,
    Icons.account_circle_rounded,
  ];

  // Default index
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Video',
                    style: GoogleFonts.kantumruyPro(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 35.0,
                      ),
                      SizedBox(width: 5.0),
                      Icon(
                        Icons.search,
                        size: 35.0,
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Scrolling category
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(4.0),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    // Category
                    SizedBox(
                      height: 60.0,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 110),
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: currentIndex == index
                                        ? Colors.indigo.withOpacity(.2)
                                        : Colors.indigo.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0,
                                      vertical: 10.0,
                                    ),
                                    child: Text(
                                      items[index],
                                      style: GoogleFonts.kantumruyPro(
                                        fontSize: 15.0,
                                        fontWeight: currentIndex == index
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: currentIndex == index
                                            ? Colors.indigo.shade900
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    // Content body
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 540.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icons[currentIndex],
                            size: 80.0,
                            color: Colors.indigo,
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            items[currentIndex],
                            style: GoogleFonts.kantumruyPro(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
