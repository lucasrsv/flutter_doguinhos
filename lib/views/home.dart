import 'package:doguinhos/controllers/doguinhos_controller.dart';
import 'package:doguinhos/views/shared/image_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = DoguinhosController();

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  _start() {
    return Container();
  }

  _success() {
    return ListView.builder(
        itemCount: controller.doguinhos.message?.length,
        itemBuilder: (context, index) {
          final alreadySaved = controller.checkSaveds(index);
          return InkWell(
            child: ImageCard(
                imageUrl: controller.doguinhos.message![index],
                alreadySaved: alreadySaved),
            onTap: () {
              setState(() {
                controller.manageSaveds(alreadySaved, index);
              });
            },
          );
        });
  }

  _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  _error() {
    return Center(
      child: CupertinoButton(
          onPressed: () {
            controller.start();
          },
          child: const Text('Tentar novamente')),
    );
  }

  manageState(DoguinhosState state) {
    switch (state) {
      case DoguinhosState.start:
        return _start();
      case DoguinhosState.success:
        return _success();
      case DoguinhosState.loading:
        return _loading();
      case DoguinhosState.error:
        return _error();
      default:
        return _start();
    }
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Chihuahuas favoritos <3'),
            ),
            body: ListView.builder(
                itemCount: controller.saved.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ImageCard(
                        imageUrl: controller.saved.elementAt(index),
                        alreadySaved: true),
                  );
                }),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chihuahuas!'),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: _pushSaved,
              tooltip: 'Chihuahuas favoritos',
            ),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: controller.state,
          builder: (context, value, child) {
            return manageState(controller.state.value);
          },
        ));
  }
}
