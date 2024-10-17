import 'package:flutter/material.dart';
import 'package:transliterasi/transliterate_sunda.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TransliterateSunda(),
    );
  }
}

// class TransliterasiApp extends StatefulWidget {
//   const TransliterasiApp({super.key});

//   @override
//   State<TransliterasiApp> createState() => _TransliterasiAppState();
// }

// class _TransliterasiAppState extends State<TransliterasiApp> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Tambahkan listener untuk mendengarkan perubahan teks
//     _controller.addListener(() {
//       setState(() {
//         // Memperbarui state setiap kali teks berubah
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _controller
//         .dispose(); // Jangan lupa dispose controller untuk menghindari memory leak
//     super.dispose();
//   }

//   String transliterasi(String kata) {
//     var teks = AksaraJawa().latinToJava(kata).trim();
//     return teks;
//   }

//   String transliterasiManual(String kata) {
//     Map<String, String> transliterasiMap = {
//       'a': 'ꦲ', 'b': 'ꦧ', 'c': 'ꦕ', 'd': 'ꦢ', 'e': 'ꦲꦺ',
//       'f': 'ꦥ꦳', 'g': 'ꦒ', 'h': 'ꦲꦃ', 'i': 'ꦲꦶ', 'j': 'ꦗ',
//       // Tambahkan transliterasi lainnya di sini
//     };

//     String hasil = '';
//     for (int i = 0; i < kata.length; i++) {
//       String char = kata[i].toLowerCase();
//       if (transliterasiMap.containsKey(char)) {
//         hasil += transliterasiMap[char]! + ' ';
//       } else {
//         hasil +=
//             char; // Biarkan huruf yang tidak ada dalam map tetap seperti aslinya
//       }
//     }
//     return hasil.trim(); // Menghapus spasi di ujung string
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Text(
//             'Tes Transliterasi',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           TextFormField(
//             controller: _controller,
//             decoration: const InputDecoration(
//               labelText: 'Masukkan kata',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 30),
//           Text(
//             transliterasiManual(_controller.text),
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//           ),
//         ],
//       ),
//     );
//   }
// }
