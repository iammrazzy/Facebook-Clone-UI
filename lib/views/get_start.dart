import 'package:facebook_clone/auths/sign_in.dart';
import 'package:facebook_clone/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStart extends StatefulWidget {
  const GetStart({super.key});

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  // user name
  List<String> userName = [
    'រ៉ា',
    'This user is ប្រេះស្រាំ 💔😊',
  ];

  // list image
  List<String> userImage = [
    'images/Razz.jpg',
    'images/User.png',
  ];

  // show message
  void showMSG(String msg, Color color) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 15.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            tileMode: TileMode.clamp,
            colors: [
              Color.fromARGB(255, 13, 45, 78),
              Color.fromARGB(255, 5, 39, 90),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom setting button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showMSG(
                          'I\'m working on it...!',
                          Colors.red,
                        );
                      },
                      child: SvgPicture.asset(
                        'images/Setting.svg',
                        height: 30.0,
                        width: 30.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),

                // Facebook logo
                const SizedBox(height: 70.0),
                Center(
                  child: Image.asset(
                    'images/Facebook.png',
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
                const SizedBox(height: 70.0),
                Divider(color: Colors.grey.withOpacity(.7)),
                // Text
                const SizedBox(height: 8.0),
                Text(
                  'Facebook requests and receives your phone number from your mobile network.',
                  style: GoogleFonts.kantumruyPro(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // do somthing here
                  },
                  child: Text(
                    'Change Settings',
                    style: GoogleFonts.kantumruyPro(
                      fontSize: 15.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Divider(color: Colors.white, thickness: 1.0),

                // User account
                const SizedBox(height: 5.0),
                Column(
                  children: List.generate(
                    userName.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          // check if index == 0 go to Home()
                          index == 0
                              ? Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Home(),
                                  ),
                                  (route) => false,
                                )
                              : showMSG(
                                  'User នេះត្រូវគេបោកជាទម្ងន់...! 💔😊',
                                  Colors.red,
                                );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          height: 80.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // User image profile
                                Container(
                                  height: 80.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        userImage[index],
                                      ),
                                    ),
                                  ),
                                ),

                                // User name
                                const SizedBox(width: 10.0),
                                Text(
                                  userName[index],
                                  style: GoogleFonts.kantumruyPro(
                                    fontSize: index == 0 ? 18.0 : 15.0,
                                    color:
                                        index == 0 ? Colors.white : Colors.red,
                                    fontWeight: FontWeight.bold,
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

                // Log into another account button
                const SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(.7),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Text(
                      'Log into another account',
                      style: GoogleFonts.kantumruyPro(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Create new account button
                const SizedBox(height: 95.0),
                GestureDetector(
                  onTap: () {
                    showMSG(
                      'I\'m working on it...!',
                      Colors.red,
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Text(
                      'Create new account',
                      style: GoogleFonts.kantumruyPro(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),

                // Meta logo
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'images/Meta.svg',
                      height: 25.0,
                      width: 25.0,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 2.0),
                    Text(
                      'Meta',
                      style: GoogleFonts.kantumruyPro(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
