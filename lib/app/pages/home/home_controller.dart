import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_test/app/data/models/agent_model.dart';
import 'package:getx_test/app/data/repository/agents_repository.dart';

class HomeController extends GetxController {
  final AgentsRepository repository;
  final List<AgentModel> _agents = <AgentModel>[].obs;
  final RxBool _loading = false.obs;
  RxBool get loading => _loading;
  List<AgentModel> get agents => _agents;
  HomeController({
    required this.repository,
  });

  getValorantAgents() async {
    _loading.value = true;
    final response = await repository.getValorantAgents();
    _agents.addAll(response);
    _loading.value = false;
  }
}
