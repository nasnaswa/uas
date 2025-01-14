import 'package:myapp/app/modules/barang/views/barang_update_view.dart';
import 'package:myapp/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/barang/controllers/barang_controller.dart';

class BarangView extends GetView<BarangController> {
  void showOption(id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.to(
                BarangUpdateView(),
                arguments: id,
              );
            },
            title: Text('Update'),
          ),
         ListTile(
            onTap: () {
              Get.back();
              controller.delete(id);
            },
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: Get.put(BarangController()).streamData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // mengambil data
          var listAllDocs = snapshot.data?.docs ?? [];
          return listAllDocs.length > 0
              ? ListView.builder(
                  itemCount: listAllDocs.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                      backgroundColor: Color.fromARGB(255, 248, 248, 248),
                    ),
                    title: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["nama_barang"]}"),
                    subtitle: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["harga_barang"]}"),
                    trailing: IconButton(
                        onPressed: () => showOption(listAllDocs[index].id),
                        icon: Icon(Icons.more_vert)),
                  ),
                )
              : Center(
                  child: Text("Data Kosong"),
                );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
