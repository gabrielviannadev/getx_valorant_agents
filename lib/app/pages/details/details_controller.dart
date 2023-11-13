import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_test/app/data/models/agent_model.dart';
import 'package:getx_test/app/data/repository/agents_repository.dart';

class DetailsController extends GetxController {
  final AgentsRepository repository;
  final RxBool _loading = false.obs;
  AgentModel? _agentModel;
  AgentModel? get agentModel => _agentModel;
  RxBool get loading => _loading;

  DetailsController({
    required this.repository,
  });

  Future getAgentDetail({required int agentIndex}) async {
    _loading.value = true;
    final response = await repository.getAgentDetail(agentIndex: agentIndex);
    _agentModel = response;
    _loading.value = false;
  }
}
