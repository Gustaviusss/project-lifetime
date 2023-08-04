import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timerapp/app/controllers/counter_controller.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CounterController>();
    final size = MediaQuery.of(context).size;
    return Expanded(
      flex: 5,
      child: LayoutBuilder(
        builder: (_, BoxConstraints constraints) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            children: [
              // Expanded(
              //   flex: 3,
              //   child: Center(
              //     child: Text(
              //       "Projects",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize:
              //             constraints.maxWidth > 350 ? 65 : size.width * .09,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                flex: 8,
                child: Obx(
                  () => controller.records.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Você ainda não tem projetos :(',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * .03),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30),
                                child: ElevatedButton.icon(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepPurple,
                                        padding: EdgeInsets.all(20)),
                                    icon: Icon(Icons.add_circle_rounded),
                                    label: Text("Criar um novo")),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.records.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              child: Card(
                                color: Colors.deepPurple,
                                child: ListTile(
                                  leading: Icon(
                                    Icons.album,
                                    color: Colors.grey.shade200,
                                  ),
                                  title: Text(
                                    'Project ${index + 1}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                      'Duration: ${controller.records[index]}',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      controller.records
                                          .remove(controller.records[index]);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
              // const SizedBox(height: 20),
              // Center(
              //   child: Container(
              //     padding: const EdgeInsets.only(left: 4, right: 2),
              //     height: 55,
              //     width: size.width,
              //     child: ElevatedButton.icon(
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.black87,
              //         textStyle: const TextStyle(color: Colors.white),
              //       ),
              //       onPressed: () {},
              //       icon: const Icon(Icons.add_circle_outline),
              //       label: const Text(
              //         'Add new Project',
              //         style:
              //             TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
