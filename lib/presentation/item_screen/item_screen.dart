import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '/widgets/custom_search_view.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemScreen extends StatefulWidget {
  ItemScreen({super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

final availableHeight = mediaQueryData.size.height -
    mediaQueryData.padding.top -
    mediaQueryData.padding.bottom -
    kBottomNavigationBarHeight;
final availableWidth = mediaQueryData.size.width -
    mediaQueryData.padding.left -
    mediaQueryData.padding.right;

class _ItemScreenState extends State<ItemScreen> {
  late String IngredientName;
  final CollectionReference ingredients =
      FirebaseFirestore.instance.collection('ingredients_item');

  Future<void> create(String name) {
    print('created');
    return ingredients
        .add({'name': name})
        .then((value) => print('Ingredient Added'))
        .catchError((error) => print('Failed to add ingredient: $error'));
  }

  Stream<QuerySnapshot> read() {
    return ingredients.snapshots();
  }

  Future<void> update(String docID, String newIngredientName) {
    return ingredients
        .doc(docID)
        .update({'name': newIngredientName})
        .then((value) => print('Ingredient Updated'))
        .catchError((error) => print('Failed to update ingredient: $error'));
  }

  Future<void> delete(String docID) {
    return ingredients
        .doc(docID)
        .delete()
        .then((value) => print('Ingredient Deleted'))
        .catchError((error) => print('Failed to delete ingredient: $error'));
  }

  getIngredientName(name) {
    this.IngredientName = name;
  }

  void openDialogBox(String? docID) {
    print(docID);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextFormField(
          controller: widget.nameController,
          decoration: InputDecoration(
            labelText: "Nome do Ingrediente",
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
          onChanged: (String name) {
            getIngredientName(name);
          },
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: availableWidth * 0.15,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () {
                    if (docID == null) {
                      create(this.IngredientName);
                    } else {
                      update(docID, this.IngredientName);
                    }

                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: availableWidth * 0.15,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () {
                    delete(docID!);
                    Navigator.of(context).pop();
                  },
                  child: Text('Deletar', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void exportData() async {
    final CollectionReference ingredients =
        FirebaseFirestore.instance.collection('ingredients_item');
    final myData = await rootBundle.loadString('assets/ingredientes.csv');

    List<List<dynamic>> csvTable = const CsvToListConverter().convert(myData);

    List<List<dynamic>> data = [];

    data = csvTable;

    for (var i = 0; i < data.length; i++) {
      ingredients.add({'name': data[i][0]});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.red,
          body: Column(
            children: [
              _buildStackView(context, availableHeight * 0.05),
              Container(
                height: availableHeight * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: widget.nameController,
                      decoration: InputDecoration(
                        labelText: "Nome do Ingrediente",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                      ),
                      onChanged: (String name) {
                        getIngredientName(name);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: availableWidth * 0.2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0XFF842A4D),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onPressed: () => create(this.IngredientName),
                          child: Text(
                            "Adicionar",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        width: availableWidth * 0.2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo[800],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          onPressed: () => exportData(),
                          child: Text(
                            "Exportar dados",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              Container(
                height: availableHeight * 0.02,
              ),
              SingleChildScrollView(
                child: Container(
                  height: availableHeight * 0.65,
                  width: availableWidth * 0.84,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: read(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot ingredient =
                                  snapshot.data!.docs[index];
                              String docID = ingredient.id;
                              return Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Text(
                                            snapshot.data!.docs[index]['name'],
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () =>
                                                    openDialogBox(docID),
                                                icon:
                                                    const Icon(Icons.settings)),
                                            IconButton(
                                                onPressed: () => delete(docID),
                                                icon: const Icon(Icons.delete)),
                                          ],
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return Text('Nenhum ingrediente cadastrado...');
                        }
                      }),
                ),
              ),
            ],
          )),
    );
  }

  Widget _buildStackView(BuildContext context, altura) {
    return SizedBox(
      height: altura,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 50.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: appTheme.blueGray50,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: AppDecoration.outlineBlack900,
              child: Text(
                "CoZZinhe",
                style: theme.textTheme.displayMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
