import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final List<String> reports = [];
  final controller = TextEditingController();

  void addReport() {
    setState(() {
      reports.add(controller.text);
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Community")),
      body: Column(
        children: [
          TextField(controller: controller),
          ElevatedButton(onPressed: addReport, child: Text("Post")),
          Expanded(
            child: ListView(
              children: reports.map((r) => ListTile(title: Text(r))).toList(),
            ),
          )
        ],
      ),
    );
  }
}