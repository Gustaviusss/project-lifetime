import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timerapp/app/controllers/counter_controller.dart';

import '../../../core/widgets/custom_button.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //Instância do Getx
    final controller = Get.put(CounterController());
    final size = MediaQuery.of(context).size;
    return Expanded(
      flex: 5,
      child: LayoutBuilder(
        builder: (_, BoxConstraints constraints) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${controller.digitHours}:${controller.digitMinutes}:${controller.digitSeconds}',
                    style: TextStyle(
                      fontSize:
                          constraints.maxWidth > 450 ? 75 : size.width * .1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                    onPressed: () {
                      controller.addProjectsDuration();
                      if (controller.seconds.value != 0) {
                        controller.reset();
                      }
                    },
                    icon: Icons.stop,
                    size: constraints.maxWidth > 450 ? 60 : size.width * .08),
                Obx(
                  () => CustomButton(
                      onPressed: () {
                        if (controller.started.value == false) {
                          controller.start();
                        } else {
                          controller.stop();
                        }
                      },
                      icon: controller.started.value == false
                          ? Icons.play_arrow
                          : Icons.pause,
                      size: constraints.maxWidth > 450 ? 60 : size.width * .08),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
