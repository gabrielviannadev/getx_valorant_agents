import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_test/app/pages/details/details_page.dart';
import 'package:getx_test/app/pages/home/home_controller.dart';
import 'package:getx_test/app/pages/home/home_injection.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    homeDependecyInjection();
    _controller = Get.find<HomeController>();
    _controller.getValorantAgents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valorant GetX | Agents App'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return _controller.loading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _controller.agents.length,
                  itemBuilder: (_, index) {
                    final item = _controller.agents[index];
                    return ListTile(
                        title: const Text(
                          'A g e n t',
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                        onTap: () {
                          Get.to(() => DetailsPageView(agentIndex: index));
                        },
                        subtitle: Text(
                          item.agentName!,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        leading: Container(
                          width: 60,
                          height: 60,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(item.agentArtWork!),
                            backgroundColor: Colors.red,
                          ),
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_right));
                  },
                );
        },
      ),
    );
  }
}
