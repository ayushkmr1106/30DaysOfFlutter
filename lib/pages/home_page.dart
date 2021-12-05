// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets/item_widget.dart';
import 'package:flutter/src/services/asset_bundle.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    final data = jsonDecode(catalogJson);
    var productsData = data["products"];
    // save data to CatalogModel(class).item in catalog.dart
    // CatalogModel.items = productsData.map<Item>((item) => Item.fromJson(item)).toList(); OR
    await Future.delayed(const Duration(seconds: 2));
    CatalogModel.items = productsData.map<Item>((item) => Item(id: item["id"], name: item["name"], desc: item["desc"], price: item["price"], color: item["color"], image: item["image"])).toList();
    setState(() {});

    // print(catalogJson);
  }

  @override
  Widget build(BuildContext context) {
    // When stateless class
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Catalog App"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        ? ListView.builder(
          itemCount: CatalogModel.items.length,
          // itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              // item: CatalogModel.items[index],
              item : CatalogModel.items[index],
            );
          },
        )
        : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}