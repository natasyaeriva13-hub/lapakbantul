import 'package:flutter/material.dart';


class SplashScreen5 extends StatefulWidget {
  const SplashScreen5({super.key});

  @override
  State<SplashScreen5> createState() => _SplashScreen5State();
}

class _SplashScreen5State extends State<SplashScreen5> {
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
                "Informasi Pajak\nTerbaru",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF001F5B),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Dapatkan informasi dan\npengumuman pajak daerah dengan\ncepat",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF001F5B),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 25),

              // IMAGE
              Image.asset(
                "assets/images/pajak.png",
                height: 430,
              ),

              const Spacer(),

              // BUTTON MASUK
              SizedBox(
                width: double.infinity,
                height: 65,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4D27B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),

                  onPressed: () => Navigator.pop(context),

                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(width: 10),

                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 28,
                      ),
                    ],
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