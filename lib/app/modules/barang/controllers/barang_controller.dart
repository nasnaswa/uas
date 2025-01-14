import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarangController extends GetxController {
  //TODO: Implement MahasiswaController
  late TextEditingController cNamaBarang;
  late TextEditingController cKodeBarang;
  late TextEditingController cHargaBarang;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference barang_22312165 =
        firestore.collection('barang_22312165');

    return barang_22312165.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference barang_22312165 =
        firestore.collection('barang_22312165');
    return barang_22312165.snapshots();
  }

  void add(String nama_barang, String kode_barang, String harga_barang) async {
    CollectionReference barang_22312165 =
        firestore.collection("barang_22312165");

    try {
      await barang_22312165.add({
        "nama_barang": nama_barang,
        "kode_barang": kode_barang,
        "harga_barang": harga_barang,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data barang",
          onConfirm: () {
            cNamaBarang.clear();
            cKodeBarang.clear();
            cHargaBarang.clear();
            Get.back();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Barang.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("barang_22312165").doc(id);

    return docRef.get();
  }

  void Update(String nama_barang, String kode_barang, String harga_barang,
      String id) async {
    DocumentReference barang_22312165ById =
        firestore.collection("barang_22312165").doc(id);

    try {
      await barang_22312165ById.update({
        "nama_barang": nama_barang,
        "kode_barang": kode_barang,
        "harga_barang": harga_barang,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data barang.",
        onConfirm: () {
          cNamaBarang.clear();
          cKodeBarang.clear();
          cHargaBarang.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Barang.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("barang_22312165").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNamaBarang = TextEditingController();
    cKodeBarang = TextEditingController();
    cHargaBarang = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNamaBarang.dispose();
    cKodeBarang.dispose();
    cHargaBarang.dispose();
    super.onClose();
  }
}
