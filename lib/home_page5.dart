import 'package:flutter/material.dart';

class HomePage5 extends StatefulWidget {
  const HomePage5({super.key});

  @override
  _HomePage5State createState() => _HomePage5State();
}

class _HomePage5State extends State<HomePage5> {
  TextEditingController controller = TextEditingController();
  bool tampil = false;

  void cekData() {
    if (controller.text == "764177342178410") {
      setState(() {
        tampil = true;
      });
    } else {
      setState(() {
        tampil = false;
      });
    }
  }

  Widget cardSPPT(
      String tahun, String status, Color warnaStatus, String harga) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("SPPT $tahun",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: warnaStatus,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(status, style: TextStyle(color: Colors.white)),
              )
            ],
          ),
          SizedBox(height: 10),

          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
              SizedBox(width: 5),
              Text("DS. Ngireng-ireng RT01/RW01",
                  style: TextStyle(color: Colors.grey[700])),
            ],
          ),

          SizedBox(height: 6),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.attach_money, size: 18, color: Colors.grey),
                  SizedBox(width: 5),
                  Text("NJOP Bumi dan Bangunan"),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(harga, style: TextStyle(color: Colors.white)),
              )
            ],
          ),

          SizedBox(height: 10),

          Center(
            child: Text(
              "Lihat Detail >",
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PBB"),
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF5F5F5),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                cekData(); // dijalankan saat tekan Enter
              },
              decoration: InputDecoration(
                hintText: "Masukkan NOP...",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // persegi
                ),
              ),
            ),
          ),

          if (tampil) ...[
            cardSPPT("2021", "Belum lunas", Colors.red, "200.000"),
            cardSPPT("2020", "Lunas", Colors.green, "376.000"),
          ]
        ],
      ),
    );
  }
}