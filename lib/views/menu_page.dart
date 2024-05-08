import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.menu,
              size: 80.0,
              color: Colors.indigo,
            ),
            const SizedBox(height: 15.0),
            Text(
              'Menu page',
              style: GoogleFonts.kantumruyPro(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            )
          ],
        ),
      ),
    );
  }
}
