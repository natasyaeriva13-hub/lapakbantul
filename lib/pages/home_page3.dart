import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage3());
}

class HomePage3 extends StatelessWidget {
  const HomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayananKelilingScreen(),
    );
  }
}

class LayananKelilingScreen extends StatefulWidget {
  const LayananKelilingScreen({super.key});

  @override
  State<LayananKelilingScreen> createState() =>
      _LayananKelilingScreenState();
}

class _LayananKelilingScreenState
    extends State<LayananKelilingScreen> {

  final List<String> dates = [
    '21/01/2024',
    '25/01/2024',
    '28/01/2024',
  ];

  int selectedDateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Layanan Keliling'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ===== DATE SELECTOR (SCROLLABLE) =====
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  final isSelected =
                      index == selectedDateIndex;

                  return Padding(
                    padding:
                        const EdgeInsets.only(right: 8),
                    child: OutlinedButton.icon(
                      icon: const Icon(
                        Icons.calendar_today,
                        size: 16,
                      ),
                      label: Text(
                        dates[index],
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: isSelected
                            ? const Color(0xFF0D3A66)
                            : Colors.transparent,
                        side: BorderSide(
                          color: isSelected
                              ? const Color(0xFF0D3A66)
                              : Colors.grey,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedDateIndex = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Hari ini, ${convertDateToLong(dates[selectedDateIndex])}',
              style: TextStyle(color: Colors.grey[600]),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                children: [
                  layananCard(
                    title: 'Mobil 01',
                    time: '08:00 - 16:00',
                    location:
                        'Mangir lor & Manager tengah, sendang',
                  ),
                  layananCard(
                    title: 'Mobil 02',
                    time: '08:00 - 16:00',
                    location:
                        'Mangir lor & Manager tengah, sendang',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget layananCard({
    required String title,
    required String time,
    required String location,
  }) {
    return Card(
      margin:
          const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding:
            const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        const TextStyle(
                      fontWeight:
                          FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color:
                            Colors.grey,
                      ),
                      const SizedBox(
                          width: 4),
                      Expanded(
                        child: Text(
                          location,
                          maxLines: 1,
                          overflow:
                              TextOverflow
                                  .ellipsis,
                          style: TextStyle(
                            color: Colors
                                .grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            Container(
              padding:
                  const EdgeInsets
                      .symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration:
                  BoxDecoration(
                color:
                    const Color(
                        0xFF0D3A66),
                borderRadius:
                    BorderRadius
                        .circular(6),
              ),
              child: Text(
                time,
                style:
                    const TextStyle(
                  color:
                      Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String convertDateToLong(
      String dateStr) {
    List<String> parts =
        dateStr.split('/');
    int day =
        int.parse(parts[0]);
    int month =
        int.parse(parts[1]);
    int year =
        int.parse(parts[2]);

    List<String> months = [
      '',
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    return '$day ${months[month]} $year';
  }
}