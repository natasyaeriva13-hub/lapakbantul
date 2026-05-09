import 'package:flutter/material.dart';
import 'halamanlogin.dart'; // pastikan file login ada
import 'home_page.dart'; // tujuan setelah daftar (opsional)

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              const Center(
                child: Column(
                  children: [
                    Text(
                      "Buat Akun",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Daftar untuk memulai",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text("Nama Lengkap"),
              const SizedBox(height: 8),
              _buildTextField("Masukkan nama lengkap"),

              const SizedBox(height: 16),

              const Text("Email"),
              const SizedBox(height: 8),
              _buildTextField("Masukkan email"),

              const SizedBox(height: 16),

              const Text("Password"),
              const SizedBox(height: 8),
              _buildTextField("Minimal 6 karakter", isPassword: true),

              const SizedBox(height: 16),

              const Text("Konfirmasi password"),
              const SizedBox(height: 8),
              _buildTextField("Masukkan ulang password", isPassword: true),

              const SizedBox(height: 24),

              // 🔥 BUTTON DAFTAR
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                     Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(builder: (_) => const HomePage()),
                   );
                    
                   
                  },
                  child: const Text("Daftar"),
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 TEXT MASUK
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun? "),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        "Masuk di sini",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔧 TEXTFIELD STYLE
Widget _buildTextField(String hint, {bool isPassword = false}) {
  return TextField(
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[200],
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}