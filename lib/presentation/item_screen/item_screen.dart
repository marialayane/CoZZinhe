import 'package:cozzinhe2/models/item.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '/widgets/custom_search_view.dart';
import 'ingredient_item.dart';
import '../../data/item_cat.dart';

class ItemScreen extends StatefulWidget {
  ItemScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        width: double.maxFinite,
        child: Column(children: [
          _buildStackView(context),
          SizedBox(height: 3.v),
          _buildBarraDePesquisa(context, widget.searchController),
          Container(
            margin: EdgeInsets.only(
              left: 35.h,
              right: 35.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seus Ingredientes: ',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  itemCount: Itens.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1),
                  itemBuilder: (ctx, index) {
                    return IgredientItem(
                        Itens[index],
                        Categorias.firstWhere((element) =>
                            element.id == Itens[index].categories));
                  },
                ),
              ),
            ),
          )
        ]),
      )),
    );
  }

  Widget _buildStackView(BuildContext context) {
    return SizedBox(
      height: 60.v,
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

  Widget _buildBarraDePesquisa(BuildContext context, searchController) {
    return Container(
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadius.circular(70),
      ),
      margin: EdgeInsets.only(
        left: 35.h,
        right: 35.h,
      ),
      child: CustomSearchView(
        controller: searchController,
        hintText: "Pesquisar",
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }
}
