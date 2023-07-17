import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/pages/navigator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true; //for password

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/login_img.jpeg'),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.57),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
              ),
              width: width * .8,
              height: height * 0.075,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: 'Email or phone number',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Email or phone number',
                  labelStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                  contentPadding: const EdgeInsets.only(top: 20.0, bottom: 10),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.57),
              width: width * .8,
              height: height * 0.075,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                obscureText: _obscureText,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                  contentPadding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            ElevatedButton(
              onPressed: () {
                // Continue button onPressed action
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Navgator()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xffE50914), // Netflix theme color (red)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 75.0,
                  vertical: 12.0,
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
