import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userModel.name,
          style: GoogleFonts.kantumruyPro(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                // Cover photo
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.userModel.coverImage),
                    ),
                  ),
                ),

                // Profile photo
                Container(
                  margin: const EdgeInsets.only(top: 110),
                  child: CircleAvatar(
                    radius: 74.0,
                    backgroundColor: Colors.white,
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 5,
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.userModel.image),
                        ),
                      ),
                    ),
                  ),
                ),

                // Icon shield & camera
                Container(
                  margin: const EdgeInsets.only(top: 210),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const SizedBox(
                      //   width: 55,
                      // ),
                      // const Icon(
                      //   Icons.shield,
                      //   color: Colors.white,
                      // ),
                      const SizedBox(
                        width: 95,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // User name
            const SizedBox(height: 10),
            Text(
              widget.userModel.name,
              style: GoogleFonts.kantumruyPro(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Bios
            Text(
              widget.userModel.bios,
              style: GoogleFonts.kantumruyPro(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            Text(
              '----------',
              style: GoogleFonts.kantumruyPro(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Row Button
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Add story button
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Add to story',
                                    style: GoogleFonts.kantumruyPro(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Edit profile button
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Edit profile',
                                    style: GoogleFonts.kantumruyPro(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // More option button
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.more_horiz,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    thickness: 2,
                  ),
                  const SizedBox(height: 8),

                  //Row user palce
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.userModel.home,
                        style: GoogleFonts.kantumruyPro(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  //Row user palce
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.place,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.userModel.palce,
                        style: GoogleFonts.kantumruyPro(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  //Row user marital status
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.userModel.marryStatus,
                        style: GoogleFonts.kantumruyPro(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  //Row user join facebook
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.access_time_filled_outlined,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.userModel.join,
                        style: GoogleFonts.kantumruyPro(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  //Row user follower
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.rss_feed_rounded,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.userModel.follower,
                        style: GoogleFonts.kantumruyPro(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  //Row user see more options
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'See more About ${widget.userModel.name}',
                        style: GoogleFonts.kantumruyPro(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),

                  // User hobby
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.code,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              widget.userModel.firstHobby,
                              style: GoogleFonts.kantumruyPro(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.headphones,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              widget.userModel.secondHobby,
                              style: GoogleFonts.kantumruyPro(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  //Edit public detail button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 45.0),
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Edit public detail',
                      style: GoogleFonts.kantumruyPro(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
