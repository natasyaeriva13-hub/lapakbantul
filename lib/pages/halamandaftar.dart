import 'package:flutter/material.dart';
import 'halamanlogin.dart'; 


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();
  bool _obscure = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmPassCtrl.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pendaftaran berhasil! Silakan masuk.'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Form(
          key: _formKey,
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

              const SizedBox(height: 32),
              
              TextFormField(
                  controller: _nameCtrl,
                  decoration: _inputDecor('Nama Lengkap', Icons.person_outline),
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Nama tidak boleh kosong' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecor('Email', Icons.email_outlined),
                  validator: (v) =>
                      (v == null || !v.contains('@'))
                          ? 'Masukkan email yang valid'
                          : null,
                ),

              const SizedBox(height: 16),
                TextFormField(
                  controller: _passCtrl,
                  obscureText: _obscure,
                  decoration: _inputDecor(
                    'Kata Sandi',
                    Icons.lock_outline,
                  ).copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                  validator: (v) =>
                      (v == null || v.length < 6)
                          ? 'Kata sandi minimal 6 karakter'
                          : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPassCtrl,
                  obscureText: _obscureConfirm,
                  decoration: _inputDecor(
                    'Konfirmasi Kata Sandi',
                    Icons.lock_outline,
                  ).copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () =>
                          setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                  ),
                  validator: (v) =>
                      v != _passCtrl.text ? 'Kata sandi tidak cocok' : null,
                ),
              
              const SizedBox(height: 24),

              // 🔥 BUTTON DAFTAR
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  
                  child: const Text("Daftar"),
                ),
              ),

              const SizedBox(height: 16),



              // 🔥 TEXT MASUK
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah punya akun? "),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                          color: Color(0xFF003566),
                          fontWeight: FontWeight.bold,
                        ),
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

InputDecoration _inputDecor(String label, IconData icon) => InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon, color: const Color(0xFF003566)),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF003566), width: 2),
    ),
  );
