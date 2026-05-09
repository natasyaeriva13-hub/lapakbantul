import 'package:flutter/material.dart';

class HomePage3 extends StatelessWidget {
  const HomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 1,
       centerTitle: true,
       leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
       ),
       title: const Text(
          "Layanan Keliling",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// DATE CHIPS
          SizedBox(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: const [
                DateChip(date: "21/01/2024", isActive: true),
                SizedBox(width: 12),
                DateChip(date: "25/01/2024", isActive: false),
                SizedBox(width: 12),
                DateChip(date: "28/01/2024", isActive: false),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Hari ini, 21 Januari 2024",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// CARD LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                MobilCard(
                  title: "Mobil 01",
                  location: "Mangir lor & Manager tengah, sendang",
                  time: "08:00 - 16:00",
                ),
                SizedBox(height: 16),
                MobilCard(
                  title: "Mobil 02",
                  location: "Mangir lor & Manager tengah, sendang",
                  time: "08:00 - 16:00",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DateChip extends StatelessWidget {
  final String date;
  final bool isActive;

  const DateChip({
    super.key,
    required this.date,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFF0C3C60)
            : const Color(0xFFE5E7EB),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today,
            size: 18,
            color: isActive
                ? const Color(0xFFFFC107)
                : const Color(0xFF555555),
          ),
          const SizedBox(width: 8),
          Text(
            date,
            style: TextStyle(
              color: isActive
                  ? Colors.white
                  : const Color(0xFF333333),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class MobilCard extends StatelessWidget {
  final String title;
  final String location;
  final String time;

  const MobilCard({
    super.key,
    required this.title,
    required this.location,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Color(0x0D000000), // 5% opacity black
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: Color(0xFF888888),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      location,
                      style: const TextStyle(
                        color: Color(0xFF888888),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// TIME BADGE
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF0C3C60),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Text(
              time,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}