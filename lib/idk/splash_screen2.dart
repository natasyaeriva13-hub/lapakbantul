import 'package:flutter/material.dart';


class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            children: [

              const SizedBox(height: 40),

              // LOGO & TITLE
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "LaPak ",
                      style: TextStyle(
                        color: Color(0xFF001F5B),
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "Bantul",
                      style: TextStyle(
                        color: Color(0xFFF2C94C),
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Layanan Aplikasi Pajak Daerah\nKabupaten Bantul",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF001F5B),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 35),

              // IMAGE
              Image.asset(
                "assets/images/welcome.png",
                height: 350,
              ),

              const SizedBox(height: 25),

              const Text(
                "Selamat Datang",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF001F5B),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Layanan Pajak Daerah Kabupaten\nBantul dalam satu aplikasi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF001F5B),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Spacer(),

              // BUTTON
              SizedBox(
                width: double.infinity,
                height: 65,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF001F5B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),

                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Mulai  →",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 55,
                    height: 12,
                    decoration: BoxDecoration(
                      color: const Color(0xFF001F5B),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    width: 32,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    width: 32,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}