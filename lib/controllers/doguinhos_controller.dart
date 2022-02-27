import 'package:doguinhos/models/doguinhos_model.dart';
import 'package:doguinhos/services/doguinhos_service.dart';

class DoguinhosController {
  late DoguinhosModel doguinhos;
  final service = DoguinhosService();
  DoguinhosState state = DoguinhosState.start;

  Future start() async {
    state = DoguinhosState.loading;
    try {
      doguinhos = await service.fetchDoguinhos();
      state = DoguinhosState.success;
    } catch (e) {
      state = DoguinhosState.error;
    }

  }
}

enum DoguinhosState { start, loading, success, error }