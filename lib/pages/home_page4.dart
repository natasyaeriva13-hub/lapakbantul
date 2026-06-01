import 'package:flutter/material.dart';

class PBBPage extends StatelessWidget {
  const PBBPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PBB',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            // Search box
            Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFBDBDBD), width: 1),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Color(0xFFBDBDBD),
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Masukan NOP...',
                        hintStyle: TextStyle(
                          color: Color(0xFFBDBDBD),
                          fontSize: 16,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            // Spacer for vertical alignment
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Custom icon container to mimic the image icon style
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D3B66), // navy blue background
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          // White lines representing text lines
                          Positioned(
                            top: 14,
                            left: 14,
                            right: 14,
                            child: Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 28,
                            left: 14,
                            right: 35,
                            child: Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 42,
                            left: 14,
                            right: 35,
                            child: Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                          // Magnifying glass shape
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Transform.rotate(
                                angle: 45 * 3.14 / 180,
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    width: 6,
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Text below icon
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(text: 'Masukan NOP untuk melihat\n'),
                          TextSpan(
                            text: 'rincian pajak.',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}