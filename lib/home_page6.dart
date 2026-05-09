import 'package:flutter/material.dart';

class HomePage6 extends StatelessWidget {
  const HomePage6({super.key});

  Widget item(String judul, String isi) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            judul,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            isi,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "No. NOP 378429749820294337",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 10),

              const Text(
                "AHMAD NABIL BAHROIN\nROGER SUMATRA",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Alamat Lengkap WP : Kab Bantul, Kec. Sewon, DS. Ngireng-ireng, RT01/RW01",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),
              const Divider(),

              item("Lokasi", "DS. Ngireng-ireng, RT01/RW01"),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Status",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 6),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Sudah Lunas",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 10),
                    const Divider(),
                  ],
                ),
              ),

              item("Denda", "Rp. 0"),
              item("NJOP Bumi", "Rp. 300,000"),
              item("NJOP Bangunan", "Rp. 0"),
              item("Luas Bumi", "227m"),
              item("Luas Bangunan", "0"),
              item("Tahun", "2020"),
            ],
          ),
        ),
      ),
    );
  }
}