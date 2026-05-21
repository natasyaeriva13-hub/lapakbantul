import 'package:flutter/material.dart';


class SplashScreen4 extends StatefulWidget {
  const SplashScreen4({super.key});

  @override
  State<SplashScreen4> createState() => _SplashScreen4State();
}

class _SplashScreen4State extends State<SplashScreen4> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            children: [

              const SizedBox(height: 60),

              const Text(
                "Layanan Keliling",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF001F5B),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Temukan jadwal mobil layanan\npajak keliling di sekitar anda",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF001F5B),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 30),

              // IMAGE
              Image.asset(
                "assets/images/layang.png",
                height: 430,
              ),

              const Spacer(),

              // BUTTON LANJUT
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
                    "Lanjut",
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
                    width: 32,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  const SizedBox(width: 10),

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