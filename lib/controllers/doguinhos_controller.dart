import 'package:doguinhos/models/doguinhos_model.dart';
import 'package:doguinhos/services/doguinhos_service.dart';
import 'package:flutter/material.dart';

class DoguinhosController {
  late DoguinhosModel doguinhos = DoguinhosModel();
  final DoguinhosService service;
  final state = ValueNotifier<DoguinhosState>(DoguinhosState.start);
  final saved = <String>{};

  DoguinhosController([DoguinhosService? service])
    : service = service ?? DoguinhosService();
  
  Future start() async {
    state.value = DoguinhosState.loading;
    try {
      doguinhos = await service.fetchDoguinhos();
      state.value = DoguinhosState.success;
    } catch (e) {
      state.value = DoguinhosState.error;
    }
  }

  bool checkSaveds(int index) {
    final alreadySaved = saved.contains(doguinhos.message![index]);
    return alreadySaved;
  }

  void manageSaveds(bool alreadySaved, index) {
    if (alreadySaved) {
      saved.remove(doguinhos.message![index]);
    } else {
      saved.add(doguinhos.message![index]);
    }
  }

}

enum DoguinhosState { start, loading, success, error }