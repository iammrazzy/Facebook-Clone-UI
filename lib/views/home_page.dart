import 'package:facebook_clone/models/user_model.dart';
import 'package:facebook_clone/views/mess_page.dart';
import 'package:facebook_clone/views/user_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list all users
  List<UserModel> users = allUsers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'facebook',
                      style: GoogleFonts.kantumruyPro(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[700],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.search,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MessengerPage(),
                                ),
                              );
                            },
                            child: Center(
                              child: Image.asset(
                                'images/Messenger.png',
                                height: 25.0,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // Posting
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 3.0,
                            ),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/Razz.jpg'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'What\'s on your mind?',
                          style: GoogleFonts.kantumruyPro(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          'images/Gallery.png',
                          height: 25,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Divider(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                thickness: 7,
              ),

              // User Story | Scrolling
              const SizedBox(height: 10),
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    users.length,
                    (index) {
                      var user = users[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 200,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(user.image),
                          ),
                        ),
                        child: Container(
                          height: 200,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.4),
                                Colors.black.withOpacity(.2),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>UserInfo(userModel: user),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 3,
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(user.image),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  user.name,
                                  style: GoogleFonts.kantumruyPro(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Divider(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                thickness: 7,
              ),

              // User post contents
              Column(
                children: List.generate(
                  users.length,
                  (index) {
                    var user = users[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 490.0,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // user header
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Profile & name
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => UserInfo(
                                              userModel: user,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 50.0,
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Theme.of(context).primaryColor,
                                            width: 3.0,
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(user.image),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user.name,
                                          style: GoogleFonts.kantumruyPro(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '2h |',
                                              style: GoogleFonts.kantumruyPro(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context).primaryColor,
                                              ),
                                            ),
                                            const SizedBox(width: 2),
                                            Icon(
                                              Icons.public,
                                              size: 15,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),

                                // Icons
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.more_horiz,
                                        size: 25.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          users.removeAt(index);
                                        });
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        size: 25.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                          // Description post
                          const SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10.0,
                            ),
                            child: Text(
                              user.decs,
                              style: GoogleFonts.kantumruyPro(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),

                          // Image post
                          Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(user.image),
                              ),
                            ),
                          ),

                          // Reaction
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 10.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${user.like} likes',
                                  style: GoogleFonts.kantumruyPro(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '23 comments',
                                      style: GoogleFonts.kantumruyPro(
                                        fontSize: 18.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    const SizedBox(width: 50.0),
                                    Text(
                                      '10 shares',
                                      style: GoogleFonts.kantumruyPro(
                                        fontSize: 18.0,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).primaryColor.withOpacity(0.1),
                            thickness: 2.0,
                          ),
                          // Reaction button
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // like button
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      user.isLiked = !user.isLiked;
                                      // Check if user click liked, increase number of like
                                      user.isLiked ? user.like++ : user.like--;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        user.isLiked
                                            ? Icons.thumb_up_alt
                                            : Icons.thumb_up_alt_outlined,
                                        color: user.isLiked
                                            ? Colors.indigo
                                            : Colors.black,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        user.isLiked ? 'Liked' : 'Like',
                                        style: GoogleFonts.kantumruyPro(
                                          fontSize: 18.0,
                                          color: user.isLiked
                                              ? Colors.indigo
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // comment button
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.comment_bank_outlined,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      'Comment',
                                      style: GoogleFonts.kantumruyPro(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),

                                // share button
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.share_outlined,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      'Share',
                                      style: GoogleFonts.kantumruyPro(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                          Divider(
                            color: Colors.grey[400],
                            thickness: 7,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
