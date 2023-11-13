import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/pages/details/details_controller.dart';
import 'package:getx_test/app/pages/details/details_injection.dart';

class DetailsPageView extends StatefulWidget {
  final int agentIndex;
  const DetailsPageView({super.key, required this.agentIndex});

  @override
  State<DetailsPageView> createState() => _DetailsPageViewState();
}

class _DetailsPageViewState extends State<DetailsPageView> {
  late final DetailsController _controller;

  @override
  void initState() {
    super.initState();
    detailsDependencyInjection();
    _controller = Get.find<DetailsController>();
    _controller.getAgentDetail(agentIndex: widget.agentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agent detail',
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return _controller.loading.value == true
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 180,
                          width: 180,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(_controller.agentModel!.agentArtWork ?? ''),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'A g e n t',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      _controller.agentModel!.agentName ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Divider(),
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        _controller.agentModel!.agentDescriptio ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
