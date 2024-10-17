// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class TransliterasiPage extends StatefulWidget {
//   const TransliterasiPage({super.key});

//   @override
//   State<TransliterasiPage> createState() => _TransliterasiPageState();
// }

// class _TransliterasiPageState extends State<TransliterasiPage> {
//   String _baseUrl = 'https://api-transliterasi.vercel.app';
//   TextEditingController _textInput = TextEditingController();
//   String _transliterasi = '';
//   bool _isLoading = false;
//   String? _errorMessage;

//   Future<void> transliterasi(String kata) async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });

//     try {
//       final response =
//           await http.get(Uri.parse('$_baseUrl/latin-to-sunda?text=$kata'));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           _transliterasi = data['converted'];
//         });
//       } else {
//         setState(() {
//           _errorMessage = 'Failed to load transliterasi';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'Error: $e';
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Transliterasi Latin ke Sunda'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _textInput,
//               decoration: const InputDecoration(
//                 labelText: 'Masukkan kata',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (text) {
//                 transliterasi(text);
//                 print(_transliterasi);
//               },
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 if (_textInput.text.isNotEmpty) {
//                   await transliterasi(_textInput.text);
//                 }
//               },
//               child: const Text('Transliterasi'),
//             ),
//             const SizedBox(height: 20),
//             if (_isLoading)
//               const CircularProgressIndicator()
//             else if (_errorMessage != null)
//               Text(_errorMessage!, style: const TextStyle(color: Colors.red))
//             else
//               Text(_transliterasi, style: const TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }
