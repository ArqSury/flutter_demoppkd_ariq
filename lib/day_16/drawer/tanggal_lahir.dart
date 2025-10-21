import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_16/function/input_function.dart';
import 'package:intl/intl.dart';

class TanggalLahir extends StatefulWidget {
  const TanggalLahir({super.key});

  @override
  State<TanggalLahir> createState() => _TanggalLahirState();
}

class _TanggalLahirState extends State<TanggalLahir> {
  DateTime? selectedPicked = DateTime.now();
  String? dropDownValue;
  final List<String> listJurusan = [
    "Mobile Programming",
    "Web Programming",
    "Teknik Komputer",
    "Desain Grafis Madya",
    "Content Creator",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biodata", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text("Nama:"),
            Container(
              padding: EdgeInsets.all(8),
              child: InputFunction(hint: "Masukan Nama"),
            ),
            Text("Jurusan:"),
            DropdownButton(
              value: dropDownValue,
              items: listJurusan.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(val, style: TextStyle(color: Colors.black)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  dropDownValue = value;
                });
              },
            ),
            Text("Tanggal Lahir:"),
            Row(
              spacing: 8,
              children: [
                Text(DateFormat('dd-MMMM-yyyy').format(selectedPicked!)),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedPicked = picked;
                      });
                    }
                  },
                  child: Icon(Icons.calendar_today),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
