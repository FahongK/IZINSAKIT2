import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // globalkey untuk form

  TextEditingController inputNamaSiswa = TextEditingController();
  TextEditingController inputKataSandi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Izin Sakit"),
        backgroundColor: const Color(0xffFFFFFF),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 240, 239),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, // menghubungkan key ke form
          child: Column(
            children: [
              const SizedBox(height: 20),
              // image
              Center(
                child: Image(
                  image: const AssetImage('asset/icons/is_icons.png'),
                  width: 250,
                  height: 250,
                ),
              ),
              const SizedBox(height: 16),

              // menginput nama siswa
              Center(
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: inputNamaSiswa,
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(192, 245, 237, 196),
                      hintText: 'Masukan Nama Siswa',
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                    ),
                    // validasi input nama pengguna
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nama siswa wajib diisi';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // menginput kata sandi
              Center(
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: inputKataSandi,
                    obscureText: true,
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(255, 207, 89, 89),
                      hintText: 'Masukan Kata Sandi',
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                    ),
                    // validasi input kata sandi
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Kata sandi wajib diisi';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // tombol
              ElevatedButton(
                child: const Text("Login"),
                onPressed: () {
                  // menjalankan validasi
                  if (_formKey.currentState!.validate()) {
                    print("Nama: ${inputNamaSiswa.text}");
                    print("Sandi: ${inputKataSandi.text}");
                    Navigator.pushReplacementNamed(context, "/home");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
