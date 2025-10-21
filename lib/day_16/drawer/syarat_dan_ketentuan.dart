import 'package:flutter/material.dart';

class SyaratKetentuan extends StatefulWidget {
  const SyaratKetentuan({super.key});

  @override
  State<SyaratKetentuan> createState() => _SyaratKetentuanState();
}

class _SyaratKetentuanState extends State<SyaratKetentuan> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Syarat dan Ketentuan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 560,
                width: double.infinity,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.grey,
                ),
                child: SingleChildScrollView(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sed tristique leo. Proin rhoncus quam sed nulla luctus hendrerit. Integer ac velit neque. Sed turpis diam, hendrerit nec diam id, sodales scelerisque metus. Integer lacinia ac augue at placerat. Donec eu auctor libero, sed viverra erat. Maecenas rhoncus ligula vitae urna malesuada, eget accumsan nulla luctus. Curabitur id vehicula odio. Aliquam lobortis lorem quis elit dignissim bibendum. Quisque viverra bibendum neque, ac fermentum lectus elementum ac. Vestibulum faucibus enim nibh, vel convallis ligula iaculis gravida. Phasellus tincidunt eu nisl eget facilisis. Pellentesque facilisis porttitor mollis. Fusce ac nisl et orci rutrum rhoncus. Sed euismod tincidunt lorem. In a enim gravida, dictum felis vel, euismod mauris. Duis rhoncus pretium erat vel consectetur. Suspendisse tincidunt arcu quis enim ultricies, et luctus est efficitur. Pellentesque in posuere diam, quis blandit nulla. Phasellus id urna orci. Duis varius semper massa. Sed bibendum eget orci a feugiat. Aenean porta magna leo, ac finibus eros consectetur at. Sed euismod magna eget accumsan hendrerit. Vivamus cursus suscipit turpis non ultrices. Donec ut lectus risus. In leo odio, aliquet vitae semper nec, vulputate id justo. Phasellus in urna urna. Vestibulum mollis lacinia orci, at egestas magna vestibulum et. Donec bibendum et ligula at maximus. Nam mattis molestie nibh, in tincidunt enim condimentum quis. Vivamus vitae tellus auctor, eleifend massa ac, pharetra enim. In hac habitasse platea dictumst. Fusce aliquam ac lectus ac aliquam. Fusce efficitur mi et nibh iaculis ultrices. Nunc ac libero sem. Curabitur tincidunt libero non mauris commodo dapibus non pharetra risus. Suspendisse tempor lobortis sem a accumsan. Ut vel lectus hendrerit, elementum nisi ultrices, dictum mi. Sed gravida elit et mi ornare, vel condimentum lacus eleifend. Proin eleifend tempus augue, ac fermentum nulla blandit quis. Integer ornare ullamcorper sapien, non feugiat augue dapibus a. In non odio sodales, lobortis magna quis, tincidunt sapien. Vestibulum ut tristique dui. Etiam sodales placerat nulla congue feugiat. Quisque ornare, enim at vulputate hendrerit, dolor purus semper dui, non euismod nisl urna quis risus. Maecenas imperdiet elementum semper. Pellentesque facilisis efficitur magna, a efficitur sem tristique vel. Mauris a odio et ex pulvinar rutrum quis vel ex. Sed nec velit sed diam volutpat mattis. Donec diam ipsum, venenatis ut lectus ut, varius auctor metus. Nunc lorem erat, aliquam non ultrices a, congue bibendum nunc. Suspendisse imperdiet consectetur diam id congue. Fusce sit amet massa feugiat, consequat mi sed, congue enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas fermentum bibendum risus, volutpat dapibus ligula ultricies id. Nulla gravida congue interdum. Etiam a arcu sit amet diam cursus feugiat vitae a justo. Suspendisse nisl magna, mollis in sem quis, sagittis vulputate lacus. Maecenas id rutrum lacus, porttitor facilisis enim. Proin pulvinar viverra elementum. In vestibulum porta sapien tincidunt lacinia. In fringilla blandit eros sed hendrerit. Praesent convallis elit justo, nec sollicitudin leo luctus at. Donec tincidunt nec libero sit amet sodales. Aliquam ipsum mi, mattis rutrum accumsan ut, venenatis interdum diam. Donec vulputate laoreet tellus, ac sodales libero imperdiet vel. Quisque vestibulum nec mi non vehicula. Maecenas et ultricies velit. ",
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text("Saya menyetujui semua persyatan yang berlaku"),
                ],
              ),
              Text(
                isChecked
                    ? "Lanjutkan pendaftaran diperbolehkan"
                    : "Anda belum bisa melanjukan pendaftaran",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isChecked ? Colors.blue : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
