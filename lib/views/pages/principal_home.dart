import 'package:flutter/material.dart';
import 'package:my_portfolio/views/components/menu.dart';

import '../../shared/widgets/menu_button.dart';

class PrincipalHome extends StatefulWidget {
  const PrincipalHome({super.key});

  @override
  State<PrincipalHome> createState() => _PrincipalHomeState();
}

class _PrincipalHomeState extends State<PrincipalHome> {
  final scrollController = ScrollController();

  //controle da posição das seções
  final keySecao1 = GlobalKey();
  final keySecao2 = GlobalKey();
  final keySecao3 = GlobalKey();

  void dispose() {
    scrollController.dispose();
    super.dispose();
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
            Expanded(
              child: Container(
                key: keySecao1,
                color: Colors.green,
                height: 250,
                child: const Text('teste 1'),
              ),
            ),
            Expanded(
              child: Container(
                key: keySecao2,
                color: Colors.pink,
                height: 500,
                child: const Text('teste 2'),
              ),
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

  void _onMenuClick(int value) {
    final RenderBox renderBox;

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
      default:
        throw Exception();
    }
    final offset = renderBox.localToGlobal(Offset.zero);
    scrollController.animateTo(offset.dy,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}

class Menu extends StatelessWidget {
  final ValueChanged<int> onMenuClick;

  const Menu({super.key, required this.onMenuClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => onMenuClick(1),
          child: Text('seção 1'),
        ),
        TextButton(
          onPressed: () => onMenuClick(2),
          child: Text('seção 2'),
        ),
        TextButton(
          onPressed: () => onMenuClick(3),
          child: Text('seção 3'),
        ),
      ],
    );
  }
}
