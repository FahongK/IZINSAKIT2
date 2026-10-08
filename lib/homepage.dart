import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputNamaSiswa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MASUK IZIN"),
        backgroundColor: const Color(0xffFFFFFF),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 226, 83, 90),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(8)),

          Center(
            child: SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 241, 247, 248),
                  hintText: 'Masukan Nama Siswa',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
                controller: inputNamaSiswa,
                onFieldSubmitted: (values) {
                  inputNamaSiswa.text = values;
                },
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(16)),
          ElevatedButton(
            child: const Text("Tampilkan Nama Siswa"),
            onPressed: () {
              print(inputNamaSiswa.text);
            },
          ),
          const SizedBox(height: 12),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
