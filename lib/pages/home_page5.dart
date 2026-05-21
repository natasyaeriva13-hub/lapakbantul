import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'home_page6.dart';
import 'home_page.dart';

class HomePage5 extends StatefulWidget {
  const HomePage5({super.key});

  @override
  State<HomePage5> createState() => _HomePage5State();
}

class _HomePage5State extends State<HomePage5> {
  TextEditingController controller = TextEditingController();
  bool tampil = false;

  List dataPbb = [];

 List<String> histori = [
    "764177342178410"
  ];
  bool tampilHistori = false;

  Future<void> loadJson() async {

  final String response =
      await rootBundle.loadString(
        'assets/data/pbb.json',
      );

  final data = json.decode(response);

  setState(() {
    dataPbb = data;
  });
}

@override
void initState() {
  super.initState();
  loadJson();
}
  void cekData() {
    if (
  dataPbb.any(
    (item) =>
        item["nop"] == controller.text,
  )
) {
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
      BuildContext context,
      String tahun, 
      String status, 
      Color warnaStatus, 
      String harga) {
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
  child: status == "Lunas"
      ? InkWell(
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage6()),
            );
          },
          child: Text(
            "Lihat Detail >",
            style: TextStyle(color: Colors.grey),
          ),
        )
      : Text(
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
            );
          },
        ),
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
              onTap:() {
                setState(() {
                  tampilHistori = true;
                });
              },
              onSubmitted: (value) {
                cekData(); // dijalankan saat tekan Enter
              },

              onChanged: (value) {
                setState(() {
                  tampilHistori = value.isEmpty; // tampil histori jika input kosong
                });
              },
              decoration: InputDecoration(
                hintText: "Masukan NOP...",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // persegi
                ),
              ),
            ),
          ),

          if (tampilHistori)
  Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
        )
      ],
    ),

    child: ListTile(
      leading: Icon(Icons.history),

      title: Text("764177342178410"),

      onTap: () {

        controller.text = "764177342178410";

        setState(() {
          tampilHistori = false;
        });

        cekData();
      },
    ),
  ),
        if (!tampil)
          Column(
              children: [
                Icon(
                  Icons.search,
                  size: 70,
                  color: const Color(0xFF003566),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Masukan NOP untuk melihat\nrincian pajak.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),

          if (tampil)
  ...dataPbb
      .where(
        (item) =>
            item["nop"] ==
            controller.text,
      )
      .map(
        (item) => cardSPPT(
          context,
          item["tahun"],
          item["status"],
          item["status"] == "Lunas"
              ? Colors.green
              : Colors.red,
          item["harga"],
        ),
      ),
        ],
      ),
    );
  }
}