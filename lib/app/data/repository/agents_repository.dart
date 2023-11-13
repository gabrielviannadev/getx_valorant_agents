import 'package:dio/dio.dart';
import 'package:getx_test/app/data/models/agent_model.dart';

class AgentsRepository {
  final Dio dio;

  AgentsRepository({required this.dio});

  Future<List<AgentModel>> getValorantAgents() async {
    final result = await dio.get('https://valorant-api.com/v1/agents');
    final List<AgentModel> agents = [];

    if (result.statusCode == 200) {
      result.data['data'].map((item) => agents.add(AgentModel.fromMap(item))).toList();
    }
    return agents;
  }

  Future<AgentModel?> getAgentDetail({required int agentIndex}) async {
    final result = await dio.get('https://valorant-api.com/v1/agents');

    late AgentModel agentDetail;

    if (result.statusCode == 200) {
      agentDetail = AgentModel.fromMap(result.data['data'][agentIndex]);
    }
    return agentDetail;
  }
}
