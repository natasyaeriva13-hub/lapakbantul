import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color(0xFF001F5B),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 20),

              // FOTO PROFILE
              CircleAvatar(
                radius: 60,
                backgroundColor: const Color(0xFF001F5B),
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage:
                      AssetImage("assets/images/Ellipse 6.png"),
                ),
              ),

              const SizedBox(height: 20),

              // NAMA
              const Text(
                "Ahmad Nabil",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF001F5B),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "ahmadnabil@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              // CARD PROFILE
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    buildMenu(
                      Icons.person_outline,
                      "Informasi Akun",
                    ),

                    const Divider(),

                    buildMenu(
                      Icons.lock_outline,
                      "Ubah Password",
                    ),

                    const Divider(),

                    buildMenu(
                      Icons.notifications_none,
                      "Notifikasi",
                    ),

                    const Divider(),

                    buildMenu(
                      Icons.help_outline,
                      "Bantuan",
                    ),

                    const Divider(),

                    buildMenu(
                      Icons.logout,
                      "Logout",
                      isLogout: true,
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

  Widget buildMenu(
    IconData icon,
    String title, {
    bool isLogout = false,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: Icon(
        icon,
        color: isLogout
            ? Colors.red
            : const Color(0xFF001F5B),
      ),

      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isLogout
              ? Colors.red
              : Colors.black,
        ),
      ),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: Colors.grey,
      ),

      onTap: () {},
    );
  }
}