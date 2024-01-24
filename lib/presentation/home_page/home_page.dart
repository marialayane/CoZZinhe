import '../home_page/widgets/homelist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:luko1de_s_cozzinhe/core/app_export.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_elevated_button.dart';
import 'package:luko1de_s_cozzinhe/widgets/custom_search_view.dart';
import 'package:luko1de_s_cozzinhe/widgets/navbar.dart';
import 'package:luko1de_s_cozzinhe/presentation/receita_screen/receita_screen.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MediaQueryData mediaQueryData;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              width: double.maxFinite,
              decoration: AppDecoration.outlineBlack9002,
              child: Column(
                children: [
                  SizedBox(height: 3.v),
                  _buildStackView(context),
                  SizedBox(height: 3.v),
                  _buildBarraDePesquisa(context),
                  SizedBox(height: 10.v),
                  _buildFiltrosRow(context),
                  SizedBox(height: 10.v),
                  _buildHomeList(context),
                ],
              ),
            ),
            // Adicione a barra de navegação no topo do Stack
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomNavBar(selectedIndex: 0),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
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

  /// Section Widget
  Widget _buildBarraDePesquisa(BuildContext context) {
    return Container(
      width: 360.h,
      margin: EdgeInsets.symmetric(horizontal: 35.h),
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder15,
      ),
      child: CustomSearchView(
        width: 24.adaptSize,
        controller: searchController,
        autofocus:
            false, // Definir autofocus como false para evitar o foco automático
      ),
    );
  }

  /// Section Widget
  Widget _buildFiltrosRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 35.h,
        right: 47.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.v),
            child: Text(
              "Sugestões",
              style: theme.textTheme.titleLarge,
            ),
          ),
          CustomElevatedButton(
            height: 30.v,
            width: 108.h,
            text: "Filtros",
            margin: EdgeInsets.only(bottom: 5.v),
            leftIcon: Container(
              margin: EdgeInsets.only(right: 8.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgMifilter,
                height: 24.v,
                width: 18.h,
              ),
            ),
            buttonTextStyle: CustomTextStyles.bodyMediumBlack90014,
            onPressed: () {
              _showFilterDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal:
                  10.0), // Ajuste o padding do conteúdo conforme necessário
          backgroundColor: Colors.white, // Cor de fundo branca
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                0), // Ajuste o raio do arredondamento conforme necessário
          ),
          title: Container(
            color: Colors.white, // Cor de fundo branca
            child: Column(
              children: [
                Text(
                  "Filtro",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Cor do texto preta
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Ordenar por",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                _buildOrderOption("5 Estrelas", [
                  ImageConstant.imgStar15,
                  ImageConstant.imgStar15,
                  ImageConstant.imgStar15,
                  ImageConstant.imgStar15,
                  ImageConstant.imgStar15,
                ]),
                _buildOrderOption("4 Estrelas", [
                  ImageConstant.imgStar15,
                  ImageConstant.imgStar15,
                  ImageConstant.imgStar15,
                  ImageConstant.imgStar15,
                  ImageConstant.imgStarEmpty,
                ]),
                _buildOrderOption("3 Estrelas", [
                  ImageConstant.imgStar15,
                  ImageConstant.imgStar15,
                  ImageConstant.imgStar15,
                  ImageConstant.imgStarEmpty,
                  ImageConstant.imgStarEmpty,
                ]),
                _buildOrderOption("2 Estrelas", [
                  ImageConstant.imgStar15,
                  ImageConstant.imgStar15,
                  ImageConstant.imgStarEmpty,
                  ImageConstant.imgStarEmpty,
                  ImageConstant.imgStarEmpty,
                ]),
                _buildOrderOption("1 Estrela", [
                  ImageConstant.imgStar15,
                  ImageConstant.imgStarEmpty,
                  ImageConstant.imgStarEmpty,
                  ImageConstant.imgStarEmpty,
                  ImageConstant.imgStarEmpty,
                ]),
                Text(
                  "Tempo",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black, // Cor do texto preta
                  ),
                ),
                SizedBox(height: 8),
                _buildMinuteDropdown(),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(132, 42, 77, 1),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Fechar o diálogo
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(width: 16), // Ajuste o espaçamento conforme necessário
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(132, 42, 77, 1),
                  ),
                  onPressed: () {
                    // Lógica para aplicar os filtros
                    Navigator.of(context).pop(); // Fechar o diálogo
                  },
                  child: Text(
                    "Filtrar",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildOrderOption(String option, List<String> iconPaths) {
    return TextButton(
      onPressed: () {
        // Lógica para a opção selecionada
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              iconPaths.length,
              (index) => Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: CustomImageView(
                  imagePath: iconPaths[index],
                  height: 25.0, // Ajuste a altura da imagem conforme necessário
                  width: 25.0, // Ajuste a largura da imagem conforme necessário
                ),
              ),
            ),
          ),
          SizedBox(width: 16), // Espaçamento entre os ícones e o texto
          Text(
            option,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight
                    .normal), // Ajuste o tamanho do texto conforme necessário
          ),
        ],
      ),
    );
  }

  Widget _buildMinuteDropdown() {
    TextEditingController minutesController = TextEditingController();
    int selectedMinutes = 30; // Valor padrão

    void increaseMinutes() {
      setState(() {
        selectedMinutes += 15;
        minutesController.text = selectedMinutes.toString();
      });
    }

    void decreaseMinutes() {
      setState(() {
        if (selectedMinutes > 15) {
          selectedMinutes -= 15;
          minutesController.text = selectedMinutes.toString();
        }
      });
    }

    return Row(
      children: [
        Text(
          "Tempo de preparo",
          style: TextStyle(
              fontSize: 15.0,
              color: Colors.black), // Ajuste o tamanho conforme necessário
        ),
        SizedBox(width: 30.0),
        Container(
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(241, 241, 243, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              bottomLeft: Radius.circular(35.0),
            ),
          ),
          child: IconButton(
            icon: Icon(Icons.remove),
            onPressed: decreaseMinutes,
            color: Color.fromRGBO(132, 42, 77, 1),
            iconSize: 30,
            alignment: Alignment.topLeft,
          ),
        ),
        Expanded(
          child: Container(
            height: 30.0, // Ajuste a altura do contêiner
            width: 30.0, // Ajuste a largura conforme necessário
            color: Color.fromRGBO(220, 220, 220, 1),
            child: TextField(
              controller: minutesController,
              keyboardType: TextInputType.name,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Container(
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(241, 241, 243, 1), // Cor de fundo cinza
            borderRadius: BorderRadius.only(
              topRight:
                  Radius.circular(35.0), // Arredondar apenas no topo direito
              bottomRight:
                  Radius.circular(35.0), // Arredondar apenas no bottom direito
            ),
          ),
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: increaseMinutes,
            color: Color.fromRGBO(132, 42, 77, 1),
            iconSize: 30,
            alignment: Alignment.topLeft,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildHomeList(BuildContext context) {
    // Exemplo de dados para cada item na lista
    List<Map<String, String>> itemList = [
      {
        'imagePath': ImageConstant.boloDeBanana,
        'title': 'Bolo de Banana',
        'rating': '5',
        'time': '120 min',
      },
      {
        'imagePath': ImageConstant.boloDeCenoura,
        'title': 'Bolo de Cenoura',
        'rating': '4.5',
        'time': '40 min',
      },
      {
        'imagePath': ImageConstant.pratocamarao,
        'title': 'Risoto de Camarão',
        'rating': '5',
        'time': '40 min',
      },
      {
        'imagePath': ImageConstant.guioza,
        'title': 'Guioza',
        'rating': '5',
        'time': '55 min',
      },
      {
        'imagePath': ImageConstant.boloIntegral,
        'title': 'Bolo Integral',
        'rating': '3.5',
        'time': '75 min',
      },
      {
        'imagePath': ImageConstant.imageNotFound,
        'title': 'ImageNotFound',
        'rating': '?',
        'time': '?',
      },
      {
        'imagePath': ImageConstant.imageNotFound,
        'title': 'ImageNotFound',
        'rating': '?',
        'time': '?',
      },
    ];

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 12.v,
            );
          },
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            final item = itemList[index];
            return InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ReceitaScreen()),
                );
                // Lógica a ser executada quando o item for clicado
                print("Item clicado: ${item['title']}");
              },
              child: HomelistItemWidget(
                imagePath: item['imagePath'] ?? '',
                title: item['title'] ?? '',
                rating: item['rating'] ?? '',
                time: item['time'] ?? '',
              ),
            );
          },
        ),
      ),
    );
  }
}
