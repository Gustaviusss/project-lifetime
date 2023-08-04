// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'components/custom_timer.dart';
import 'components/project_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Duration duration = const Duration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF687bc7),
      body: LayoutBuilder(
        builder: (_, BoxConstraints constraints) => Center(
            child: constraints.maxWidth > 700
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      CustomTimer(),
                      ProjectList(),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      CustomTimer(),
                      ProjectList(),
                    ],
                  )),
      ),
    );
  }
}
