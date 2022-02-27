import 'package:doguinhos/models/doguinhos_model.dart';
import 'package:doguinhos/services/doguinhos_service.dart';

class HomeController {
  late DoguinhosModel doguinhos;
  final service = DoguinhosService();

  Future start() async {
    doguinhos = await service.fetchDoguinhos();
  }
}