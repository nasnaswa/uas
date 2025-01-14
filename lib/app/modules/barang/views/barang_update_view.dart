import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/barang/controllers/barang_controller.dart';

class BarangUpdateView extends GetView<BarangController> {
  const BarangUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Data Barang'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.GetDataById(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNamaBarang.text = data['nama_barang'];
            controller.cKodeBarang.text = data['kode_barang'];
            controller.cHargaBarang.text = data['harga_barang'];
            return Padding(
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
                    onPressed: () => controller.Update(
                      controller.cNamaBarang.text,
                      controller.cKodeBarang.text,
                      controller.cHargaBarang.text,
                      Get.arguments,
                    ),
                    child: Text("Ubah"),
                  )
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
