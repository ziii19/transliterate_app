import 'package:flutter/material.dart';
import 'package:transliterasi/transliterasi_service.dart';

class TransliterateSunda extends StatefulWidget {
  const TransliterateSunda({super.key});

  @override
  State<TransliterateSunda> createState() => _TransliterateSundaState();
}

class _TransliterateSundaState extends State<TransliterateSunda> {
  final TextEditingController _latinText = TextEditingController();
  final TextEditingController _sundaText = TextEditingController();

  @override
  void initState() {
    super.initState();
    _latinText.addListener(() {
      setState(() {});
    });
    _sundaText.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _latinText.dispose();
    _sundaText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transliterasi aksara sunda'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Transliterasi Latin ke Sunda',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _latinText,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan kata latin',
                ),
              ),
              const SizedBox(height: 20),
              const Text('Hasil transliterasi'),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SelectableText(
                    TransliterasiService.latinToSunda(_latinText.text),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              const Text(
                'Transliterasi Sunda ke Latin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _sundaText,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan kata latin',
                ),
              ),
              const SizedBox(height: 20),
              const Text('Hasil transliterasi'),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SelectableText(
                    TransliterasiService.sundaToLatin(_sundaText.text),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
