import 'package:flutter/material.dart';

class AturPengingat extends StatefulWidget {
  const AturPengingat({super.key});

  @override
  State<AturPengingat> createState() => _AturPengingatState();
}

class _AturPengingatState extends State<AturPengingat> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alarm", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 20,
          children: [
            Text("Atur Pengingat", style: TextStyle(fontSize: 28)),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    selectedTime = picked;
                  });
                }
              },
              child: Text("Pilih Waktu Pengingat"),
            ),
            Text(
              selectedTime == null
                  ? "Waktu belum dipilih"
                  : "Pengingat diatur pukul ${selectedTime!.format(context)} ",
            ),
          ],
        ),
      ),
    );
  }
}
