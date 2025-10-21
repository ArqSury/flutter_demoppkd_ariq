import 'package:flutter/material.dart';

class ProdukKategori extends StatefulWidget {
  const ProdukKategori({super.key});

  @override
  State<ProdukKategori> createState() => _ProdukKategoriState();
}

class _ProdukKategoriState extends State<ProdukKategori> {
  String? dropDownValue;
  final List<String> listProduct = [
    "Elektronik",
    "Makanan",
    "Otomotif",
    "Sastra",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(8)),
          Text(
            "Kategori Produk",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            spacing: 8,
            children: [
              Padding(padding: EdgeInsets.all(8)),
              Text("Pilih produk:"),
              DropdownButton(
                value: dropDownValue,
                items: listProduct.map((String val) {
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
            ],
          ),
          Divider(),
          Expanded(child: Column(children: [])),
        ],
      ),
    );
  }
}
