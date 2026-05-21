import 'package:flutter/material.dart';
import 'halamanlogin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  static const _pages = [
    _SplashData(
      title: 'Selamat Datang',
      description: 'Layanan Pajak Daerah Kabupaten Bantul dalam satu aplikasi',
      image: 'assets/images/welcome.png',
    ),
    _SplashData(
      title: 'Cek Pajak PBB Dengan Mudah',
      description:
          'Lihat status pembayaran, detail SPPT, dan informasi pajak langsung dari HP',
      image: 'assets/images/PBB.png',
    ),
    _SplashData(
      title: 'Layanan Keliling',
      description:
          'Temukan jadwal mobil layanan pajak keliling di sekitar anda',
      image: 'assets/images/layang.png',
    ),
    _SplashData(
      title: 'Informasi Pajak Terbaru',
      description:
          'Dapatkan informasi dan pengumuman pajak daerah dengan cepat',
      image: 'assets/images/pajak.png',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goToNext() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemCount: _pages.length,
            itemBuilder: (_, i) => _SplashPage(data: _pages[i]),
          ),
          if (_currentPage < _pages.length - 1)
            Positioned(
              top: 50,
              right: 24,
              child: TextButton(
                onPressed: _skip,
                child: const Text(
                  'Lewati',
                  style: TextStyle(color: Color(0xFF001F5B), fontSize: 16),
                ),
              ),
            ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == i ? 55 : 32,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _currentPage == i
                            ? const Color(0xFF001F5B)
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: _goToNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF001F5B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        _currentPage == _pages.length - 1
                            ? 'Mulai'
                            : 'Selanjutnya',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SplashData {
  final String title;
  final String description;
  final String image;

  const _SplashData({
    required this.title,
    required this.description,
    required this.image,
  });
}

class _SplashPage extends StatelessWidget {
  final _SplashData data;

  const _SplashPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'LaPak ',
                    style: TextStyle(
                      color: const Color(0xFF001F5B),
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Bantul',
                    style: TextStyle(
                      color: const Color(0xFFF2C94C),
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Color(0xFF001F5B),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              data.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF001F5B),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Center(
                child: Image.asset(
                  data.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
                 