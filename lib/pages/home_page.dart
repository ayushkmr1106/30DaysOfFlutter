// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets/item_widget.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_app/widgets/theme.dart';


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
    await Future.delayed(const Duration(seconds: 2));
    // save data to CatalogModel(class).item in catalog.dart
    // CatalogModel.items = productsData.map<Item>((item) => Item.fromJson(item)).toList(); 
    // OR
    CatalogModel.items = productsData.map<Item>((item) => Item(id: item["id"], name: item["name"], desc: item["desc"], price: item["price"], color: item["color"], image: item["image"])).toList();
    setState(() {});

    // print(catalogJson);
  }

  @override
  Widget build(BuildContext context) {
    // When stateless class
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     title: const Text("Catalog App"),
    //   ),

    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     // CatalogModel.items != null &&
    //     child: (CatalogModel.items.isNotEmpty)
    //     // ? ListView.builder(
    //     //   itemCount: CatalogModel.items.length,
    //     //   // itemCount: dummyList.length,
    //     //   itemBuilder: (context, index) {
    //     //     return ItemWidget(
    //     //       item : CatalogModel.items[index],
    //     //     );
    //     //   },
    //     // )
    //     ? GridView.builder(
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         mainAxisSpacing: 16,
    //         crossAxisSpacing: 16,
    //       ), 
    //       itemBuilder: (context, index) {
    //         final item = CatalogModel.items[index];
    //         return Card(
    //           // Clip Behaviour for smoother edges
    //           clipBehavior: Clip.antiAlias,
    //           // shape for rouded edges
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(10)
    //           ),
    //           child: GridTile(
    //             header: Container(
    //               child: Text(item.name),
    //               padding: const EdgeInsets.all(12),
    //               decoration: const BoxDecoration(
    //                 color: Colors.blue,
    //               ),
    //             ),
    //             child: Image.network(item.image),
    //             footer: Text(
    //               item.price.toString(),
    //             ),
    //           ),
    //         );
    //       },
    //       itemCount: CatalogModel.items.length,
    //     )
    //     : const Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   ),
    //   drawer: const MyDrawer(),
    // );

    // For Decoration (Ch-15: Beautiful UI And Vx)
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                const CatalogList().expand()
              else 
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ) 
        ),
      )
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      }
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({required this.catalog, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.sm.color(Colors.grey.shade700).make(),
              const SizedBox(height: 10,),
              // Or
              // Text(
              //   catalog.desc,
              //   style: TextStyle(
              //     // color: Theme.of(context).textTheme.caption,
              //     color: Colors.grey.shade600
              //     // fontWeight: FontWeight.w100,
              //   ),
              // ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MyTheme.darkBluishColor,
                      ),
                      shape: MaterialStateProperty.all(
                        const StadiumBorder(),
                      )
                    ),
                    child: "Buy".text.make(),
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py8();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({required this.image, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}