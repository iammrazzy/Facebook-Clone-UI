import 'package:facebook_clone/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Controller
  final _email = TextEditingController();
  final _password = TextEditingController();

  // Show & hide password
  bool _obscureText = true;

  // Global key
  final _formKey = GlobalKey<FormState>();

  // User info
  String email = 'razzy@gmail.com', password = 'razzy123';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Custom setting button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            'images/Back.svg',
                            height: 30.0,
                            width: 30.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),

                    // Choose language
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'English (US)',
                          style: GoogleFonts.kantumruyPro(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 25.0,
                          color: Colors.white,
                        ),
                      ],
                    ),

                    // Facebook logo
                    const SizedBox(height: 60.0),
                    Center(
                      child: Image.asset(
                        'images/Facebook.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),

                    // E-mail or phone number field
                    const SizedBox(height: 60.0),
                    TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(.1),
                        hintText: 'Mobile number or email',
                        hintStyle: GoogleFonts.kantumruyPro(
                          fontSize: 17.0,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your E-mail!';
                        } else if (value != email) {
                          return 'Oops! Invalid e-mail!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    // Password field
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: _password,
                      obscureText: _obscureText,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(.1),
                        hintText: 'Password',
                        hintStyle: GoogleFonts.kantumruyPro(
                          fontSize: 17.0,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white.withOpacity(.5),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password!';
                        } else if (value != password) {
                          return 'Oops! Invalid password!';
                        } else {
                          return null;
                        }
                      },
                    ),

                    // Sign In button
                    const SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // The form is valid.
                          String tempEmail = _email.text;
                          String tempPassword = _password.text;
                          if (tempEmail == email && tempPassword == password) {
                            // If signed in success to go Facebook home
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                              (route) => false,
                            );
                            // print in console
                            print('Signed In...!');
                          }
                        } else {
                          // The form is invalid.
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width,
                          50.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        'Log in',
                        style: GoogleFonts.kantumruyPro(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // Forgot password button
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.kantumruyPro(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Create new account button
                    const SizedBox(height: 120.0),
                    GestureDetector(
                      onTap: () {
                        // Do something here
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
        ),
      ),
    );
  }
}
