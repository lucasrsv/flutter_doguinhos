import 'package:doguinhos/models/doguinhos_model.dart';
import 'package:doguinhos/services/doguinhos_service.dart';
import 'package:flutter/material.dart';

class DoguinhosController {
  late DoguinhosModel doguinhos;
  final service = DoguinhosService();
  final state = ValueNotifier<DoguinhosState>(DoguinhosState.start);


  Future start() async {
    state.value = DoguinhosState.loading;
    try {
      doguinhos = await service.fetchDoguinhos();
      state.value = DoguinhosState.success;
    } catch (e) {
      state.value = DoguinhosState.error;
    }

  }
}

enum DoguinhosState { start, loading, success, error }