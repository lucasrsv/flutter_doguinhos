import 'package:doguinhos/controllers/doguinhos_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

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
        return ListTile(
          title: Text('item $index'),
        );
      }
    );
  }

  _error() {
    return Center(
      child: CupertinoButton(
        onPressed: () {
          controller.start();
        },
        child: Text('Tentar novamente')
      ),
    );
  }
    
  _loading() {
    return Center(
      child: CircularProgressIndicator()
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: manageState(DoguinhosState.error)
    );
  }
}