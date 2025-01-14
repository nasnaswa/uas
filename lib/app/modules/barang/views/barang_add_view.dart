
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/barang/controllers/barang_controller.dart';

class BarangAddView extends GetView<BarangController> {
  const BarangAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Barang'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNamaBarang,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Nama Barang"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cKodeBarang,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Kode Barang"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cHargaBarang,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Harga Barang"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cNamaBarang.text,
                controller.cKodeBarang.text,
                controller.cHargaBarang.text,
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
