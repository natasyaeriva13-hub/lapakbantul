import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/home_page3.dart';
import '../pages/home_page5.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _selectedIndex = 0;

  static const _pages = <Widget>[
    HomePage(),
    HomePage3(),
    HomePage5(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 30,
        ),
        height: 95,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // BACKGROUND NAVBAR
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFF002B5B),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildItem(
                  index: 0,
                  icon: Icons.home_outlined,
                  label: "Home",
                ),
                buildItem(
                  index: 1,
                  icon: Icons.local_shipping_outlined,
                  label: "Layanan Keliling",
                ),
                buildItem(
                  index: 2,
                  icon: Icons.description_outlined,
                  label: "PBB",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    bool isActive = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = index);
      },
      child: SizedBox(
        width: 110,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // ACTIVE CIRCLE
            if (isActive)
              Positioned(
                top: -28,
                child: Container(
                  width: 78,
                  height: 78,
                  decoration: BoxDecoration(
                    color: const Color(0xFF002B5B),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 8,
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: 34,
                    color: Colors.white,
                  ),
                ),
              ),
            // LABEL
            Positioned(
              bottom: 22,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isActive ? Colors.white : Colors.transparent,
                ),
              ),
            ),
            // ICON NON ACTIVE
            if (!isActive)
              Icon(
                icon,
                size: 34,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}