import 'package:flutter/material.dart';
import 'home_page6.dart';


class PbbApp extends StatelessWidget {
  const PbbApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PBB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PbbPage(),
    );
  }
}

class PbbPage extends StatefulWidget {
  const PbbPage({Key? key}) : super(key: key);

  @override
  _PbbPageState createState() => _PbbPageState();
}

class _PbbPageState extends State<PbbPage> {
  final TextEditingController _controller = TextEditingController();
  bool _showResults = false;

  void _onSubmit() {
    final input = _controller.text.trim();
    setState(() {
      _showResults = input == '764177342178410';
    });

    if (!_showResults) {
      // show feedback if needed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nomor tidak cocok')),
      );
    }
  }

  Widget _buildStatusTag(String text, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPbbItem({
  required String year,
  required String address,
  required String njop,
  required String status,
  required Color statusColor,
  bool isDetailClickable = false,
}) { 
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Year + Status Tag
            Row(
              children: [
                Text(
                  'SPPT $year',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                _buildStatusTag(status, statusColor),
              ],
            ),
            const SizedBox(height: 8),
            // Address Row
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    address,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            // NJOP Row
            Row(
              children: [
                const Icon(Icons.home_outlined, size: 18, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  'NJOP Bumi dan Bangunan',
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    njop,
                    style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Lihat Detail
            isDetailClickable
    ? Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const DetailSPPT(),
              ),
            );
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Lihat Detail',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward_ios, size: 14),
            ],
          ),
        ),
      )
    : InkWell(
        onTap: () {},
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Lihat Detail',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 4),
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PBB'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // Search Input Box
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Masukkan Nomor',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _onSubmit(),
            ),
            const SizedBox(height: 16),
            // Show results if input is submitted
            if (_showResults) ...[
              _buildPbbItem(
                year: '2021',
                address: 'DS. Nglireng Ijoja RT01/RW01',
                njop: '200,000',
                status: 'BelumLunas',
                statusColor: const Color.fromARGB(255, 224, 55, 55),
              ),
              
              _buildPbbItem(
  year: '2020',
  address: 'DS. Nglireng Ijoja RT01/RW01',
  njop: '376,000',
  status: 'Lunas',
  statusColor: Colors.green,
  isDetailClickable: true, // 🔥 aktif
),
              
            ],
          ],
        ),
      ),
    );
  }
}