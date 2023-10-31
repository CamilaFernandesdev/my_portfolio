import 'package:flutter/material.dart';
import '../components/menu.dart';

class PrincipalHome extends StatefulWidget {
  const PrincipalHome({super.key});

  @override
  State<PrincipalHome> createState() => _PrincipalHomeState();
}

class _PrincipalHomeState extends State<PrincipalHome> {
  final scrollController = ScrollController();

  late final RenderBox renderBox;

  //controle da posição das seções
  final keySecao1 = GlobalKey();
  final keySecao2 = GlobalKey();
  final keySecao3 = GlobalKey();

  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onMenuClick(int value) {
    final offset = renderBox.localToGlobal(Offset.zero);
    scrollController.animateTo(offset.dy + scrollController.offset,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    switch (value) {
      case 1:
        renderBox = keySecao1.currentContext!.findRenderObject() as RenderBox;
        break;
      case 2:
        renderBox = keySecao2.currentContext!.findRenderObject() as RenderBox;
        break;
      case 3:
        renderBox = keySecao3.currentContext!.findRenderObject() as RenderBox;
        break;
      // default:
      // throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scrollController.animateTo(Offset.zero as double,
              duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
        },
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Menu(
              onMenuClick: _onMenuClick,
            ),
            Container(
              key: keySecao1,
              color: Colors.green,
              height: 1250,
              child: const Text('teste 1'),
            ),
            Container(
              key: keySecao2,
              color: Colors.pink,
              height: 1500,
              child: const Text('teste 2'),
            ),
            Container(
              key: keySecao3,
              color: Colors.black,
              height: 1200,
              child: const Text('teste 3'),
            ),
          ],
        ),
      ),
    );
  }
}
