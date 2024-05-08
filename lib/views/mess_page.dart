import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessengerPage extends StatefulWidget {
  const MessengerPage({super.key});

  @override
  State<MessengerPage> createState() => _MessengerPageState();
}

class _MessengerPageState extends State<MessengerPage> {
  // Search controller
  final userController = TextEditingController();

  // get all products
  List<UserModel> users = allUsers;

  // search user
  void searchUser(String query) {
    final suggestions = allUsers.where(
      (user) {
        final userName = user.name.toLowerCase();
        final input = query.toLowerCase();
        return userName.contains(input);
      },
    ).toList();
    setState(() => users = suggestions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // do something here
                      },
                      child: const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      'Chats',
                      style: GoogleFonts.kantumruyPro(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // do something here
                      },
                      child: const Icon(
                        Icons.edit_calendar_outlined,
                        size: 30,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),

                // Search field
                const SizedBox(height: 20),
                Container(
                  height: 45.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    controller: userController,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: searchUser,
                  ),
                ),

                // User story
                const SizedBox(height: 20),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      users.length,
                      (index) {
                        var user = users[index];
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.indigo,
                                  width: 3,
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(user.image),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 47, left: 47),
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //User name
                            const SizedBox(height: 5),
                            Text(
                              user.name,
                              style: GoogleFonts.kantumruyPro(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                // User chats
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(users.length, (index) {
                      var user = users[index];
                      return Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.indigo,
                                width: 3,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(user.image),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 47, left: 47),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name,
                                style: GoogleFonts.kantumruyPro(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${user.name}: ${user.mes}',
                                    style: GoogleFonts.kantumruyPro(
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    user.date,
                                    style: GoogleFonts.kantumruyPro(
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: const BoxDecoration(
                                      color: Colors.indigo,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
